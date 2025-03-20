import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:board/feature/presentation/viewmodel/board_write/board_write_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardWritePage extends HookConsumerWidget {
  const BoardWritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = (GoRouter.of(context).state.extra
            as Map<String, dynamic>?)?['isEditing'] ??
        false;

    return DefaultLayout(
      title: isEditing ? '공지 수정' : '공지 작성',
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 300.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.expensesColor,
                        width: 2.0,
                      ),
                    ),
                    hintText: '게시글 작성칸',
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              Column(
                children: [
                  Text('사진을 등록해 주세요'),
                  Row(
                    children: [
                      // 이미지 업로드
                      GestureDetector(
                        onTap: () {
                          // 이미지 업로드
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 32.0,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      // 프리뷰 및 삭제
                      Stack(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/mario.png'), // FileImage 사용
                                // image: FileImage(File(_image!.path)),
                              ),
                            ),
                            // child: Text('사진 추가'),
                          ),
                          Positioned(
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () {
                                // 알림 없이 사진 삭제
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: AppColor.grey,
                                  borderRadius: BorderRadius.circular(
                                      AppSizes.borderRadiusXL),
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 10.0,
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          FloatingGradientButton(
              title: isEditing ? '공지 수정하기' : '공지 작성하기',
              onTap: () {
                context.go('/boards');
              }),
        ],
      ),
    );
  }
}
