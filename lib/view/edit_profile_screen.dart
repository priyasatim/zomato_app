import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart' hide ProfileState, ProfileSuccess, ProfileError, ProfileLoading;

class EditProfilePage extends StatefulWidget {
  final String userName;

  const EditProfilePage({Key? key, required this.userName})
      : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  SharedPreferences? prefs;

  /// Controllers
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _emailController;
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _anniversaryController =
  TextEditingController();

  String? _selectedGender;
  File? _profileImage;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.userName);
    _mobileController =
        TextEditingController(text: "+91 9967019467");
    _emailController =
        TextEditingController(text: "priyasatim@example.com");

    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// Wait until prefs loaded
    if (prefs == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocProvider(
      create: (_) => ProfileBloc(prefs!), // ✅ FIXED
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile updated successfully")),
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Your Profile")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// PROFILE IMAGE
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),

                  const SizedBox(height: 16),

                  /// NAME
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// MOBILE
                  TextField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Mobile",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// EMAIL
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DOB
                  TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    onTap: () => _selectDate(context, _dobController),
                  ),

                  const SizedBox(height: 16),

                  /// ANNIVERSARY
                  TextField(
                    controller: _anniversaryController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Anniversary",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    onTap: () =>
                        _selectDate(context, _anniversaryController),
                  ),

                  const SizedBox(height: 16),

                  /// GENDER
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                    items: ["Male", "Female", "Other"]
                        .map(
                          (gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  /// BUTTON (BlocBuilder)
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state is ProfileLoading
                              ? null
                              : () {
                            context.read<ProfileBloc>().add(
                              UpdateProfileEvent(
                                name: _nameController.text,
                                mobile: _mobileController.text,
                                email: _emailController.text,
                                dob: _dobController.text,
                                anniversary: "",
                                gender: _selectedGender ?? "",
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE23744),
                          ),
                          child: state is ProfileLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const Text(
                            "Update Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// DATE PICKER
  Future<void> _selectDate(
      BuildContext context,
      TextEditingController controller,
      ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      controller.text =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }
}