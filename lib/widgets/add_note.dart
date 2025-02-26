
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;//in case the user enter wrong validation
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'title',
            onSaved: (value)
            {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(

            hint: 'content',
            maxLines: 5,
            onSaved: (value)
            {
              subTitle = value ;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: ()
            {
              if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                }
              else{
              autovalidateMode = AutovalidateMode.always;
                setState(() {

                });
              }
            },
          ),
          const SizedBox(
            height: 16,
          )
      
        ],
      ),
    );
  }
}
