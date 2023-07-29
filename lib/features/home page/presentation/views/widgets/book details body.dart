import 'package:bookly/core/widgete/loading%20state.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:bookly/features/home%20page/presentation/manger/similar%20book%20manger/similar%20book%20cubit.dart';
import 'package:bookly/features/home%20page/presentation/manger/similar%20book%20manger/similar%20book%20state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/book image.dart';
import '../../../../../core/widgete/book rating.dart';
import '../../../../../core/widgete/custom button.dart';
import '../../../../../core/widgete/custom horizontal list view.dart';
import '../../../../../core/widgete/error messsage state.dart';
import 'book details app bar.dart';

class BookDetailsBody extends StatefulWidget {
  const BookDetailsBody({super.key,required this.book});

  final BookModel book;

  @override
  State<BookDetailsBody> createState() => _BookDetailsBodyState();
}

class _BookDetailsBodyState extends State<BookDetailsBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SimilarBookCubit>(context).getData(category: widget.book.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
   return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BookDetailsAppBar(),
                const SizedBox(height: 30),
                SizedBox(
                  height: 250,
                  child:
                  BookImage(
                    image: widget.book.volumeInfo.imageLinks?.thumbnail ,
                  ),),
                const SizedBox(height: 38),
                Text(
                  widget.book.volumeInfo.title!,
                  style: Styles.style30,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.book.volumeInfo.authors![0],
                  style: Styles.style18.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                BookRating(rates: widget.book.volumeInfo.ratingsCount != null? widget.book.volumeInfo.ratingsCount.toString() : '0',ratingPercentage: widget.book.volumeInfo.averageRating != null? widget.book.volumeInfo.averageRating.toString() : '0'),
                const SizedBox(height: 37),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        text:  const Text(
                           'Free',
                          style: Styles.style18,
                        ),
                        onPressed: () async{

                          if(widget.book.accessInfo?.pdf?.isAvailable == true){
                            Uri url = Uri.parse(widget.book.accessInfo?.pdf?.acsTokenLink ?? '');
                            if(await canLaunchUrl(url)){
                              await launchUrl(url,mode: LaunchMode.externalApplication,);
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("sorry can't open this link"),),);
                            }
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("sorry can't open this link"),),);

                          }



                        },
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: CustomButton(
                        backgroundColor: const Color(0xffEF8262),
                        foregroundColor: Colors.white,
                        text: const Text(
                          'Preview',
                          style: Styles.style16,
                        ),
                        onPressed: () async{

                          Uri url = Uri.parse(widget.book.accessInfo?.webReaderLink ?? '');
                            if(await canLaunchUrl(url)){
                              await launchUrl(url,mode: LaunchMode.externalApplication,);
                            }
                            else{
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("sorry can't open this link"),),);
                            }



                        },
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 49),
                Row(
                  children: [
                    Text(
                      'You can also like',
                      style: Styles.style14.copyWith(fontWeight: FontWeight.bold),

                    ),
                  ],
                ),
                const SizedBox(height: 16),
                 SizedBox(
                  height: 120,
                  child: BlocBuilder<SimilarBookCubit,SimilarBookState>(
                      builder: (context,state){
                        if(state is SimilarBookSuccessState){
                          return CustomHorizontalListView(
                            books: state.books,
                          );
                        }
                        else if(state is SimilarBookFailureState){
                          return ErrorMessageState(errorMessage: state.errorMessage);
                        }
                        else{
                          return LoadingState();
                        }
                      }
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
