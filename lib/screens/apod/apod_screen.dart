import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/blocs/cubit/nasa_cubit.dart';

import '../../constants/constants.dart';

class ApodScreen extends StatelessWidget {
  const ApodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greydrk,
      body: SafeArea(
        child: BlocBuilder<NasaCubit, NasaState>(
          builder: (context, state) {
            if(state is NasaLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is NasaLoadedState){
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(state.data.url,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return child;
                          },
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 100,
                    child: Text( "Astronomy Picture of the Day",
                      style: headingStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 500,
                    left: 20,
                    right: 20,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(state.data.title,
                            style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(state.data.explanation,
                            style: subtitleStyle,
                            textAlign: TextAlign.justify,
                          )
                    
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if(state is NasaErrorState){
              return Center(
                child: Text("No Data", style: titleStyle ),
              );
            }
            return Center(
              child: Text("Value", style: titleStyle ),
            );
          },
        ),
      ),
    );
  }
}