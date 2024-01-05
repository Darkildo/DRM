library onboarding_part;

import 'package:auto_route/auto_route.dart';
import 'package:drm/code_kit/constants.dart';
import 'package:drm/code_kit/errors/app_error.dart';
import 'package:drm/parts/logger/logger_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'screens/onboarding_screen.dart';
part 'cubit/first_run_cubit.dart';
part 'cubit/first_run_state.dart';
