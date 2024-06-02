import 'package:era_developers_test_flutter/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 88, left: 16, right: 20),
      child: Row(
        children: [
          Visibility(
            visible: Navigator.of(context).canPop(),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Transform.rotate(
                angle: -90 * 3.141592653589793 / 180,
                child: SvgPicture.asset(
                  'assets/vectors/vector_2_x2.svg',
                  width: 24,
                  height: 9,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text('Notifications', style: theme.textTheme.bodySmall),
          ),
          TextButton(
            onPressed: () {
              context.read<NewsBloc>().add(MarkAllRead());
            },
            child: Text(
              'Mark all read',
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
