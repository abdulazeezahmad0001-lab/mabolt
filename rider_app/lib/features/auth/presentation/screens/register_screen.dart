import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
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
  static const _hint = Color(0xFFA3AAB6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    }
                    return null;
                  },
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

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
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.bolt_rounded,
            color: _amber,
            size: 38,
          ),
        ),
      ),
    );
  }

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
            ),
          ),
        ],
      ),
    );
  }

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
      ],
    );
  }

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
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP sent to your phone!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}

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
}