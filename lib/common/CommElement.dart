import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my212_mart/model/ModelElement.dart';
import 'package:my212_mart/model/RadioModel.dart';

class CommElement {
    
  static Widget textField1(TextEditingController textEditingController, String labelText, bool enabled, IconData iconData, bool isVisible, bool obscureText){
    return Visibility(
      visible: isVisible,
      child: TextFormField(
        controller: textEditingController,
        enabled: enabled,
        autofocus: false,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green[100]),
            borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),
          hintText: labelText,
          suffixIcon: iconData != null? Icon(iconData) : null,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: obscureText,
        validator: (value){
          if(value.isEmpty){
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }

  static List<Widget>listTextField1(List<ModelElement> listModelElement){
    List<Widget> listWidget;
    for(ModelElement li in listModelElement){
      Widget widget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: textField1(li.textEditingController, li.labelText, li.enabled, li.iconData, li.isVisible, li.obscureText),
      );
      listWidget.add(widget);
      // listWidget.add(textField1(li.textEditingController, li.labelText, li.enabled, li.iconData));
    }
    return listWidget;
  }

  static Widget textFieldOpacity1(TextEditingController textEditingController, String labelText, bool enabled, IconData iconData, double opacity, bool isObscure){
    return Opacity(
          opacity: opacity,
          child: TextFormField(
            obscureText: isObscure,
            controller: textEditingController,
            enabled: enabled,
            autofocus: false,
            decoration: InputDecoration(
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green[100]),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
              ),
              hintText: labelText,
              suffixIcon: iconData != null? Icon(iconData) : null,
              filled: true,
              fillColor: Colors.grey[200],
            ),
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text';
              }
              return null;
            },
          ),
    );
  }

  static Widget twoRadio1(String value1, String title1, String value2, String title2){
    String radioItem = '';
    RadioModel radio;
    return Column(
      children: <Widget>[
        RadioListTile(
          value: value1, 
          title: Text(title1),
          groupValue: radioItem, 
          onChanged: (val){
            radio.value = value1;
            return radio;
            // setState((){
            //   radioItem = val;
            // });
        },
        ),
        RadioListTile(
          value: value2, 
          title: Text(title2),
          groupValue: radioItem, 
          onChanged: (val){
            radio.value = value2;
            return radio;
            // setState((){
            //   radioItem = val;
            // });
        },
        ),
      ],
    );
  }

  static Widget datePicker1(TextEditingController birthDate, BuildContext context, DateTime dtBirthDate){
    return TextFormField(
          controller: birthDate,
          enabled: true,
          autofocus: false,
          decoration: InputDecoration(
            labelText: 'Birth Date',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[100]),
              borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            hintText: 'dd-MM-yyyy',
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today), 
              onPressed: ()=>showDatePicker(context: context, initialDate: dtBirthDate == null?DateTime.now():dtBirthDate,
                firstDate: DateTime(1970), lastDate: DateTime.now()).then((date) {
                    birthDate.text = new DateFormat('dd-MM-yyyy').format(date);
                }),
              ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          validator: (value){
            if(value.isEmpty){
              return 'Please select date';
            }
            return null;
          },
        );
  }

}