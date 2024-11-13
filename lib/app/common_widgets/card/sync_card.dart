import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class SyncCard extends StatelessWidget {
  final String title, count;
  final VoidCallback act;
  const SyncCard(
      {super.key, required this.title, required this.count, required this.act});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primary.withOpacity(.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: act,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primary,
                  ),
                  child: Text(
                    "Sync Now",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          if (count != '0')
            Text(
              count,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
        ],
      ),
    );
  }
}
