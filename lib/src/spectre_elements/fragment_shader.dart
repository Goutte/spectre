/*
  Copyright (C) 2013 John McCutchan

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

library spectre_fragment_shader_element;

import 'package:polymer/polymer.dart';
import 'package:spectre/spectre.dart';
import 'package:spectre/spectre_declarative.dart';

@CustomTag('s-fragment-shader')
class SpectreFragmentShaderElement extends SpectreElement {
  final Map<String, AttributeConstructor> spectreAttributeDefinitions = {};
  final List<String> requiredSpectreAttributes = [];

  FragmentShader _shader;
  FragmentShader get shader => _shader;

  void created() {
    super.created();
  }

  void inserted() {
    super.inserted();
    init();
  }

  void removed() {
    super.removed();
    if (inited) {
      _destroy();
    }
  }

  void init() {
    if (inited) {
      // Already initialized.
      return;
    }
    if (!declarativeInstance.inited) {
      // Not ready to initialize.
      return;
    }
    // Initialize.
    super.init();
    _create();
    _extractSource();
  }

  void _create() {
    assert(inited);
    var device = declarativeInstance.graphicsDevice;
    _shader = new FragmentShader('SpectreFragmentShader', device);
  }

  void _extractSource() {
    assert(inited);
    _shader.source = text;
  }

  void _destroy() {
    assert(inited);
    _shader.dispose();
  }
}