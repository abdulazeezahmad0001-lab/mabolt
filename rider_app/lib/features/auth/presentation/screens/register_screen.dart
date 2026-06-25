<<<<<<< HEAD
// rider_app/lib/features/auth/presentation/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'otp_screen.dart';
import 'login_screen.dart';
import '../../../../core/constants/app_colors.dart';
=======
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
<<<<<<< HEAD
=======
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  final _phoneController = TextEditingController();
  bool _isLoading = false;
=======
<<<<<<< HEAD
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  static const _ink = Color(0xFF0F1B2D);
  static const _inkSoft = Color(0xFF6B7686);
  static const _amber = Color(0xFFF59E0B);
  static const _amberDark = Color(0xFFD97706);
  static const _fieldFill = Color(0xFFF4F6F9);
=======
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'NG');
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Brand palette — matches AppColors. Swap these for AppColors.* directly
  // once you wire this file back into your project's theme.
  static const _navy = Color(0xFF103A5E);
  static const _navySoft = Color(0xFF5C7186);
  static const _amber = Color(0xFFF59E0B);
  static const _amberDark = Color(0xFFD97706);
  static const _fieldFill = Color(0xFFF4F6F9);
  static const _fieldBorder = Color(0xFFE3E8EE);
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
  static const _hint = Color(0xFFA3AAB6);
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        toolbarHeight: 44,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
=======
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
<<<<<<< HEAD
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 8),
                _buildLogo(),
                const SizedBox(height: 12),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: _ink,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                _buildPhoneField(),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _emailController,
                  hint: 'Email address',
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
=======
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                const SizedBox(height: 8),
                
                // ─── LOGO ──────────────────────────────────────────────
                Center(
                  child: SizedBox(
                    width: 140, 
                    height: 80,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.directions_car_rounded,
                          color: AppColors.deepBlue,
                          size: 72,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ─── HEADERS ───────────────────────────────────────────
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Enter your phone number to setup your profile.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 24),

                // ─── PHONE NUMBER FIELD ──────────────────────────────
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: AppColors.brightBlue,
                  decoration: InputDecoration(
                    hintText: '801 234 5678',
                    hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 15, fontWeight: FontWeight.normal),
                    filled: true,
                    fillColor: AppColors.surface,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    prefixIcon: Container(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: AppColors.borderAccent, width: 1.5),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('🇳🇬', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 6),
                          Text(
                            '+234',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.borderAccent, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.brightBlue, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.redAccent, width: 2),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please enter your phone number';
                    if (v.length < 7) return 'Enter a valid phone number';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // ─── CONTINUE BUTTON (ORANGE GRADIENT) ──────────────
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: AppColors.orangeGradient,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 56,
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                
                const Spacer(),

                // ─── OR DIVIDER ──────────────────────────────────────
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.borderAccent, thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or",
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.borderAccent, thickness: 1)),
                  ],
                ),
                const SizedBox(height: 16),

                // ─── GOOGLE SIGN IN BUTTON ───────────────────────────
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: _isLoading ? null : _handleGoogleSignIn,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.surface,
                      side: BorderSide(color: AppColors.borderAccent, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 22,
                          height: 22,
                          child: Image.asset(
                            'assets/images/google_logo.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return CustomPaint(
                                painter: _GoogleLogoPainter(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                // ─── LOGIN LINK ──────────────────────────────────────
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: AppColors.brightBlue,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),

                // ─── PRIVACY & TERMS ─────────────────────────────────
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: 'By continuing, you agree to our '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
=======
                const SizedBox(height: 12),
                _buildLogo(),
                const SizedBox(height: 28),
                _buildHeader(),
                const SizedBox(height: 28),
                _buildPhoneInput(),
                const SizedBox(height: 18),
                _buildTextField(
                  controller: _nameController,
                  label: 'Full name',
                  hint: 'Enter your full name',
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
                    }
                    return null;
                  },
                ),
<<<<<<< HEAD
                const SizedBox(height: 10),
                _buildPasswordField(),
                const SizedBox(height: 16),
                _buildRegisterButton(),
                const SizedBox(height: 14),
                _buildDivider(),
                const SizedBox(height: 12),
                _buildGoogleButton(),
                const SizedBox(height: 14),
                _buildLoginLink(),
=======
                const SizedBox(height: 18),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email (optional)',
                  hint: 'Enter your email address',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                _buildPasswordField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  obscure: _obscurePassword,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirm password',
                  hint: 'Confirm your password',
                  obscure: _obscureConfirmPassword,
                  onToggle: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                _buildRegisterButton(),
                const SizedBox(height: 16),
                _buildLoginLink(),
                const SizedBox(height: 24),
                _buildSocialLogin(),
                const SizedBox(height: 20),
                _buildTerms(),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
              ],
            ),
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => _isLoading = false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(phoneNumber: '+234 ${_phoneController.text.trim()}'),
=======
<<<<<<< HEAD
  // Big, centered logo — the brand moment for this screen.
  // Drop your asset at assets/images/logo.png; falls back to a
  // navy box with a bolt icon until it's there.
  Widget _buildLogo() {
    return Center(
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: _ink,
          borderRadius: BorderRadius.circular(18),
=======
  // Logo slot — drop your asset into assets/images/logo.png and it shows
  // automatically. Until then, this falls back to a navy placeholder so
  // the screen never crashes from a missing asset.
  Widget _buildLogo() {
    return Center(
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: _navy,
          borderRadius: BorderRadius.circular(20),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.bolt_rounded,
            color: _amber,
<<<<<<< HEAD
            size: 36,
=======
            size: 38,
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  // Flat fill, no border — this is what makes the form read as
  // "tight" instead of busy. A border on every field adds a second
  // visual layer (fill + stroke) that this design intentionally drops.
  BoxDecoration get _fieldDecoration => BoxDecoration(
        color: _fieldFill,
        borderRadius: BorderRadius.circular(12),
      );

  Widget _buildPhoneField() {
    return Container(
      height: 46,
      decoration: _fieldDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.phone_android_rounded, color: _amber, size: 18),
          const SizedBox(width: 8),
          const Text(
            '+234',
            style: TextStyle(
              color: _ink,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(width: 1, height: 18, color: const Color(0xFFE3E8EE)),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: _ink, fontSize: 14),
              decoration: const InputDecoration(
                isCollapsed: true,
                hintText: '801 234 5678',
                hintStyle: TextStyle(color: _hint, fontSize: 14),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (value.length < 7) {
                  return 'Enter a valid number';
                }
                return null;
              },
=======
  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create account',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: _navy,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Get started with your Mabolt journey',
          style: TextStyle(fontSize: 14.5, color: _navySoft),
        ),
      ],
    );
  }

  Widget _fieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          color: _navy,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  BoxDecoration get _fieldDecoration => BoxDecoration(
        color: _fieldFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _fieldBorder, width: 1.4),
      );

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('Phone number'),
        Container(
          decoration: _fieldDecoration,
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              _phoneNumber = number;
            },
            onInputValidated: (bool isValid) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: _navy),
            initialValue: _phoneNumber,
            textFieldController: _phoneController,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(signed: true),
            inputBorder: InputBorder.none,
            inputDecoration: const InputDecoration(
              hintText: 'Phone number',
              hintStyle: TextStyle(color: _hint, fontSize: 15),
              prefixIcon: Icon(Icons.phone_android_outlined,
                  color: _amber, size: 22),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        Container(
          decoration: _fieldDecoration,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            style: const TextStyle(color: _navy, fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: _hint, fontSize: 15),
              prefixIcon: Icon(icon, color: _amber, size: 22),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        Container(
          decoration: _fieldDecoration,
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            validator: validator,
            style: const TextStyle(color: _navy, fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: _hint, fontSize: 15),
              prefixIcon: const Icon(Icons.lock_outline, color: _amber, size: 22),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: _hint,
                  size: 20,
                ),
                onPressed: onToggle,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: _amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ).copyWith(
          // A soft amber shadow instead of Material's default elevation shadow
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        child: _isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.drive_eta_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Create account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(color: _navySoft, fontSize: 14),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              ' Log in',
              style: TextStyle(
                color: _amberDark,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: _fieldDecoration,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(color: _ink, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: _hint, fontSize: 14),
          prefixIcon: Icon(icon, color: _amber, size: 18),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: _fieldDecoration,
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: const TextStyle(color: _ink, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: _hint, fontSize: 14),
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: _amber, size: 18),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: _hint,
              size: 18,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: _ink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Create account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded, color: _amber, size: 18),
                ],
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE3E8EE), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('or', style: TextStyle(color: _hint, fontSize: 11)),
        ),
        const Expanded(child: Divider(color: Color(0xFFE3E8EE), thickness: 1)),
=======
  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: _fieldBorder, thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or continue with',
                style: TextStyle(color: _hint.withOpacity(0.9), fontSize: 12),
              ),
            ),
            const Expanded(child: Divider(color: _fieldBorder, thickness: 1)),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _SocialButton(icon: Icons.g_mobiledata_rounded),
            SizedBox(width: 14),
            _SocialButton(icon: Icons.apple),
            SizedBox(width: 14),
            _SocialButton(icon: Icons.facebook),
          ],
        ),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
      ],
    );
  }

<<<<<<< HEAD
  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: _fieldFill,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 18,
              height: 18,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.g_mobiledata_rounded, color: _ink, size: 22),
            ),
            const SizedBox(width: 8),
            const Text(
              'Continue with Google',
              style: TextStyle(
                color: _ink,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: _inkSoft, fontSize: 13),
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Log in',
              style: const TextStyle(color: _amberDark, fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
=======
  Widget _buildTerms() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: _hint, fontSize: 12, height: 1.5),
        children: [
          const TextSpan(text: 'By signing up, you agree to our '),
          TextSpan(
            text: 'terms',
            style:
                const TextStyle(color: _amberDark, fontWeight: FontWeight.w700),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: ' & '),
          TextSpan(
            text: 'privacy policy',
            style:
                const TextStyle(color: _amberDark, fontWeight: FontWeight.w700),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
<<<<<<< HEAD

=======
      // Simulate API call
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
<<<<<<< HEAD
            content: Text('Registration successful!'),
=======
            content: Text('OTP sent to your phone!'),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
            backgroundColor: Color(0xFF10B981),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
          ),
        );
      });
    }
  }

<<<<<<< HEAD
  void _handleGoogleSignIn() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
    });
  }

  @override
  void dispose() {
=======
  @override
  void dispose() {
<<<<<<< HEAD
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
=======
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
    _phoneController.dispose();
    super.dispose();
  }
}

<<<<<<< HEAD
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double center = w / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.8
      ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromCircle(center: Offset(center, center), radius: w / 2 - 2);

    paint.color = const Color(0xFFEA4335);
    canvas.drawArc(rect, 3.14 + 0.45, 1.2, false, paint);

    paint.color = const Color(0xFFFBBC05);
    canvas.drawArc(rect, 3.14 - 0.75, 1.2, false, paint);

    paint.color = const Color(0xFF34A853);
    canvas.drawArc(rect, 0.45, 1.3, false, paint);

    paint.color = const Color(0xFF4285F4);
    canvas.drawArc(rect, 1.75, 1.0, false, paint);
    
    final fillPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(Rect.fromLTWH(center, center - 1.9, w / 2 - 1, 3.8), fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
=======
class _SocialButton extends StatelessWidget {
  final IconData icon;

  const _SocialButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E8EE), width: 1.4),
      ),
      child: Icon(icon, color: const Color(0xFF103A5E), size: 24),
    );
  }
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
}