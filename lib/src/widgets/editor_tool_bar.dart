import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rich_editor/src/utils/javascript_executor_base.dart';
import 'package:rich_editor/src/widgets/tab_button.dart';
import 'color_picker_dialog.dart';

class EditorToolBar extends StatelessWidget {
  final Function(File image)? getImageUrl;
  final Function(File video)? getVideoUrl;
  final JavascriptExecutorBase javascriptExecutor;
  final bool? enableVideo;

  EditorToolBar({
    this.getImageUrl,
    this.getVideoUrl,
    required this.javascriptExecutor,
    this.enableVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      child: Column(
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                TabButton(
                  tooltip: 'Bold',
                  icon: Icons.format_bold,
                  onTap: () async {
                    await javascriptExecutor.setBold();
                  },
                ),
                TabButton(
                  tooltip: 'Italic',
                  icon: Icons.format_italic,
                  onTap: () async {
                    await javascriptExecutor.setItalic();
                  },
                ),
                TabButton(
                  tooltip: 'Underline',
                  icon: Icons.format_underline,
                  onTap: () async {
                    await javascriptExecutor.setUnderline();
                  },
                ),
                TabButton(
                  tooltip: 'Strike through',
                  icon: Icons.format_strikethrough,
                  onTap: () async {
                    await javascriptExecutor.setStrikeThrough();
                  },
                ),
                TabButton(
                  tooltip: 'Superscript',
                  icon: Icons.superscript,
                  onTap: () async {
                    await javascriptExecutor.setSuperscript();
                  },
                ),
                TabButton(
                  tooltip: 'Subscript',
                  icon: Icons.subscript,
                  onTap: () async {
                    await javascriptExecutor.setSubscript();
                  },
                ),
                TabButton(
                  tooltip: 'Clear format',
                  icon: Icons.format_clear,
                  onTap: () async {
                    await javascriptExecutor.removeFormat();
                  },
                ),
                TabButton(
                  tooltip: 'Undo',
                  icon: Icons.undo,
                  onTap: () async {
                    await javascriptExecutor.undo();
                  },
                ),
                TabButton(
                  tooltip: 'Redo',
                  icon: Icons.redo,
                  onTap: () async {
                    await javascriptExecutor.redo();
                  },
                ),
                TabButton(
                  tooltip: 'Blockquote',
                  icon: Icons.format_quote,
                  onTap: () async {
                    await javascriptExecutor.setBlockQuote();
                  },
                ),
                TabButton(
                  tooltip: 'Text Color',
                  icon: Icons.format_color_text,
                  onTap: () async {
                    var color = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ColorPickerDialog(color: Colors.blue);
                      },
                    );
                    if (color != null) await javascriptExecutor.setTextColor(color);
                  },
                ),
                TabButton(
                  tooltip: 'Background Color',
                  icon: Icons.format_color_fill,
                  onTap: () async {
                    var color = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ColorPickerDialog(color: Colors.blue);
                      },
                    );
                    if (color != null) await javascriptExecutor.setTextBackgroundColor(color);
                  },
                ),
                TabButton(
                  tooltip: 'Increase Indent',
                  icon: Icons.format_indent_increase,
                  onTap: () async {
                    await javascriptExecutor.setIndent();
                  },
                ),
                TabButton(
                  tooltip: 'Decrease Indent',
                  icon: Icons.format_indent_decrease,
                  onTap: () async {
                    await javascriptExecutor.setOutdent();
                  },
                ),
                TabButton(
                  tooltip: 'Align Left',
                  icon: Icons.format_align_left_outlined,
                  onTap: () async {
                    await javascriptExecutor.setJustifyLeft();
                  },
                ),
                TabButton(
                  tooltip: 'Align Center',
                  icon: Icons.format_align_center,
                  onTap: () async {
                    await javascriptExecutor.setJustifyCenter();
                  },
                ),
                TabButton(
                  tooltip: 'Align Right',
                  icon: Icons.format_align_right,
                  onTap: () async {
                    await javascriptExecutor.setJustifyRight();
                  },
                ),
                TabButton(
                  tooltip: 'Justify',
                  icon: Icons.format_align_justify,
                  onTap: () async {
                    await javascriptExecutor.setJustifyFull();
                  },
                ),
                TabButton(
                  tooltip: 'Bullet List',
                  icon: Icons.format_list_bulleted,
                  onTap: () async {
                    await javascriptExecutor.insertBulletList();
                  },
                ),
                TabButton(
                  tooltip: 'Numbered List',
                  icon: Icons.format_list_numbered,
                  onTap: () async {
                    await javascriptExecutor.insertNumberedList();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
