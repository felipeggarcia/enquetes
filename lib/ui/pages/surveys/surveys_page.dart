import 'package:carousel_slider/carousel_slider.dart';
import 'package:enquetes/ui/pages/pages.dart';
import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import 'components/components.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      appBar: AppBar(title: Text(R.strings.surveys)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CarouselSlider(
          options: CarouselOptions(enlargeCenterPage: true, aspectRatio: 1),
          items: [
            SurveyItem(),
            SurveyItem(),
            SurveyItem(),
          ],
        ),
      ),
    );
  }
}
