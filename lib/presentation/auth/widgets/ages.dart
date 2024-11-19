import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/agesdisplay/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/agesdisplay/ages_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesDisplayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AgesDisplayLoaded) {
            return   _ages(state.ages);
          }
          if (state is AgesDisplayLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages){
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context,index)=>const Gap(20), 
      itemCount: ages.length,
      itemBuilder:(context,index){
        return GestureDetector(
          onTap: (){
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectedAge(ages[index].data()['value']);
          },
          child: Text(
              ages[index].data()['value'],
              style: const TextStyle(
                fontSize: 18
              ),
            ),
        );
      } ,); 
  }
}
