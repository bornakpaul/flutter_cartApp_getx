import 'package:flutter/material.dart';
import 'package:getxcart/constants/color_constants.dart';
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
  late ImagePicker _imagePicker;
  bool _loadingImage = false;
  ProductListingIds? _product;

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
                    Image.network(
                      _selectedImagePath!,
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
            height: 32,
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
                  return "Please select reschedule reason";
                }
                return null;
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: kPrimaryColor,
              ),
              hint: const Text(
                "* Select reschedule reason",
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
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Add Product"),
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
