import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

extension ConvertToBase64 on XFile {
  Future<String> toBase64() async {
    final XFile file = this;
    final List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
}

// 0

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      // theme: ThemeData(brightness: Brightness.dark),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Dialog'),
      ),
      child: SafeArea(child: DialogCancellationExample()),
      //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
    );
  }
}

// 1

class DialogCancellationExample extends StatefulWidget {
  const DialogCancellationExample({Key? key}) : super(key: key);

  @override
  DialogCancellationExampleState createState() {
    return DialogCancellationExampleState();
  }
}

class DialogCancellationExampleState extends State<DialogCancellationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final result = await showDialog(
                context: context,
                builder: (context) {
                  return _DialogCancellationWidget();
                }) as _DialogCancellationResult?;
            if (result == null) {
              print("result: discarted");
              return;
            }
            print(
                "completed: excuse:${result.excuse} | fileBase64:${result.fileBase64?.length}");
          }),
    );
  }
}

// 2

class _DialogCancellationResult {
  final String? excuse;
  final String? fileBase64;

  _DialogCancellationResult({
    this.excuse,
    this.fileBase64,
  });
}

class _DialogCancellationWidget extends StatefulWidget {
  final TextEditingController _execuse = TextEditingController();

  @override
  _DialogCancellationState createState() => _DialogCancellationState();
}

class _DialogCancellationState extends State<_DialogCancellationWidget> {
  late bool _executeChecked = false;
  String? _execuseImageBase64;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: ModalContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'cancel_trip_confirmation_modal.title'.tr(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'cancel_trip_confirmation_modal.sub_title'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Checkbox(
                  value: _executeChecked,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      _executeChecked = value!;
                    });
                  },
                  checkColor: Colors.green,
                  activeColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Expanded(
                    child: Text(
                  'cancel_trip_confirmation_modal.recalculation_request'.tr(),
                )),
              ]),
              const SizedBox(height: 10),
              Visibility(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: widget._execuse,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return 'cancel_trip_confirmation_modal.excuse.empty'
                                        .tr();
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                ),
                                fillColor: const Color(0xFFF6F9FF),
                                filled: true,
                                hintText:
                                    'cancel_trip_confirmation_modal.excuse.hint'
                                        .tr(),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              ),
                            )),
                        const SizedBox(height: 10),
                        PickImageWidget(
                          label: 'cancel_trip_confirmation_modal.excuse.file',
                          onChanged: (String fileBase64) {
                            setState(() {
                              _execuseImageBase64 = fileBase64;
                            });
                          },
                        )
                      ]),
                  visible: _executeChecked),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: Text('button_titles.no'.tr()),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (_executeChecked &&
                            !_formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.pop(
                            context,
                            _DialogCancellationResult(
                                excuse: widget._execuse.text,
                                fileBase64: _execuseImageBase64));
                      },
                      child: Text('button_titles.yes'.tr()),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

// 3

class PickImageWidget extends StatefulWidget {
  final String label;
  final void Function(String fileBase64) onChanged;
  const PickImageWidget({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImageWidget> {
  final ImagePicker _picker = ImagePicker();
  double? execuseImageSizeInMB;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: _pickImage,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                maxLines: 4,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: execuseImageSizeInMB != null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      execuseImageSizeInMB = null;
                    });
                  },
                  child: const Icon(Icons.remove, size: 10),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'pick_image.uploaded_file'.tr(
                  args: [execuseImageSizeInMB?.toStringAsFixed(2) ?? '0.0'],
                ),
                style: const TextStyle(fontSize: 10, color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) {
      return;
    }
    final bytes = await pickedImage.length();
    final pickedImageSizeInMB = bytes / (1024 * 1024);
    final pickedImageBase64 = await pickedImage.toBase64();
    setState(() {
      execuseImageSizeInMB = pickedImageSizeInMB;
    });
    widget.onChanged(pickedImageBase64);
  }
}

// 4

class ModalContainer extends StatelessWidget {
  final Widget child;
  const ModalContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 50,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
