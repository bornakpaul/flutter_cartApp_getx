import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productTitleController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _discountPriceController = TextEditingController();
  String? _selectedImagePath;
  String? _selectedImageName;
  late ImagePicker _imagePicker;
  bool _loadingImage = false;
  ProductListingIds? _product;
  File? _image;
  bool _buttonLoading = false;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    super.initState();
  }

  @override
  void dispose() {
    _productTitleController.dispose();
    _productPriceController.dispose();
    _discountPriceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (image != null) {
      setState(() {
        _loadingImage = true;
        _selectedImagePath = image.path;
        _selectedImageName = image.name;
      });
    }
    setState(() {
      _loadingImage = false;
    });
  }

  Widget _renderImagePickerCard(
    IconData icon,
    String label,
    Color backgroundColor,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        color: backgroundColor,
        child: InkWell(
          onTap: () async {
            await _pickImage();
          },
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                  semanticLabel: label,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderImageCard() {
    if (_selectedImagePath != null) {
      setState(() {
        _image = File(_selectedImagePath!);
      });
    }
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  if (_selectedImagePath != null)
                    Image.file(
                      _image!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  if (_loadingImage)
                    Container(
                      width: 200,
                      height: 200,
                      color: kPrimaryColor,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (_selectedImagePath != null) ...[
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedImagePath = null;
              });
            },
            child: const Text(
              'UPLOAD NEW',
              style: TextStyle(
                color: kPrimaryColor,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void clearScreen() {
    _productTitleController.clear();
    _discountPriceController.clear();
    _productPriceController.clear();
    _selectedImagePath = null;
    _product = null;
    setState(() {});
  }

  Future<void> uploadProduct(context, String _imageUrl) async {
    final uploadData = UploadProduct(
      _product!.name,
      _productTitleController.text,
      _productPriceController.text,
      _discountPriceController.text,
      _imageUrl,
    );
    await FirebaseFirestore.instance
        .collection(_product!.name)
        .add(uploadData.toJson());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content:
            Text('Listing of ${_productTitleController.text} was successful'),
        duration: const Duration(seconds: 3),
      ),
    );
    clearScreen();
    setState(() {
      _buttonLoading = false;
    });
  }

  Future<void> uploadPhoto(context) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('product/$_selectedImageName');
    UploadTask uploadTask = reference.putFile(_image!);
    TaskSnapshot snapshot = await uploadTask;
    final _imageUrl = await snapshot.ref.getDownloadURL();
    uploadProduct(context, _imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        automaticallyImplyLeading: true,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            DropdownButtonFormField<ProductListingIds>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null) {
                  return "Please select ProductListingIds";
                }
                return null;
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: kPrimaryColor,
              ),
              hint: const Text(
                "* Select ProductListingIds",
                style: TextStyle(),
              ),
              value: _product,
              isDense: true,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _product = value;
                  });
                }
              },
              items: ProductListingIds.values.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _productTitleController,
              decoration: const InputDecoration(
                labelText: 'Enter the product title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product title';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _productPriceController,
              decoration: const InputDecoration(
                labelText: 'Enter the product price',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product price';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _discountPriceController,
              decoration: const InputDecoration(
                labelText: 'Enter the discount price',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the discount price';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16,
            ),
            if (_selectedImagePath != null || _loadingImage)
              _renderImageCard()
            else
              _renderImagePickerCard(
                Icons.image_rounded,
                'Upload photo',
                kPrimaryColor,
              ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _buttonLoading = true;
                  });
                  uploadPhoto(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: _buttonLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text("Add Product")),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum ProductListingIds {
  MOST_PURCHASED,
  BOOKS,
  NOTEBOOK,
  DAIRY,
  PENS,
  PENCIL,
  HIGHLIGHTER,
  A4_SHEET,
  STICKY_NOTES,
  OTHERS,
}
