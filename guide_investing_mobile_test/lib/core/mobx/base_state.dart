import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../modules/presentation/mobx/base_page.dart';

abstract class BaseStatePage<T extends StatefulWidget, S extends Store>
    extends BaseState<T, S> {}
