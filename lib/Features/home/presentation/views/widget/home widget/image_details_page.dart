import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo_impl.dart';
import 'package:sehatak/Features/articles/presentation/manger/getArticleById/get_article_by_id_cubit.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class ArticleDetailsPage extends StatelessWidget {
  final String id;

  const ArticleDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetArticleByIdCubit(ArticleRepoImpl(ApiService(Dio())))
            ..getArticleById(id),
      child: Scaffold(
        body: BlocBuilder<GetArticleByIdCubit, GetArticleByIdState>(
          builder: (context, state) {
            if (state is GetArticleByIdLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetArticleByIdFailure) {
              return Center(child: Text(state.message));
            } else if (state is GetArticleByIdSuccess) {
              final article = state.article;

              final serviceProvider = article.serviceProviderId;

              return Stack(
                children: [
                  Positioned.fill(
                    child: (article.img != null &&
                            article.img!.isNotEmpty &&
                            Uri.tryParse(article.img!)?.isAbsolute == true)
                        ? Image.network(
                            article.img!,
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/3.png",
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                      ),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/images/3.png"),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    serviceProvider?.fullName ?? 'Default Name',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Text(
                                article.title.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                article.content.toString(),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationHomeClient(),
      ),
    );
  }
}
