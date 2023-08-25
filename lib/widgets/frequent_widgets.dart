import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text(
        'oops there is an unexpected error , try later ',
        style: TextStyle(
          fontSize: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top:250),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
