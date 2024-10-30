import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_sneaker_store/data/repositories/shoe_repository.dart';
import 'package:nike_sneaker_store/domain/usecases/add_or_remove_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/add_or_remove_favourite.dart';
import 'package:nike_sneaker_store/domain/usecases/clear_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/get_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/get_favourite_shoes.dart';
import 'package:nike_sneaker_store/domain/usecases/get_shoes.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/bloc/favourite_shoes_cubit.dart';
import 'package:nike_sneaker_store/presentation/splash/splash.dart';

import 'presentation/cart/bloc/cart_shoes_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => ShoeRepository(),
        ),
        RepositoryProvider(
          create: (context) => GetShoesUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              GetCartShoesUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) => AddToCartUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              RemoveFromCartUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) => ClearCartUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              GetFavouriteShoesUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              AddToFavoritesUseCase(context.read<ShoeRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              RemoveFromFavoritesUseCase(context.read<ShoeRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartShoesCubit(
              getShoesUseCase: context.read<GetShoesUseCase>(),
              getCartShoesUseCase: context.read<GetCartShoesUseCase>(),
              addToCartUseCase: context.read<AddToCartUseCase>(),
              removeFromCartUseCase: context.read<RemoveFromCartUseCase>(),
              clearCartUseCase: context.read<ClearCartUseCase>(),
            ),
          ),
          BlocProvider(
            create: (context) => FavouriteShoesCubit(
              getShoesUseCase: context.read<GetShoesUseCase>(),
              getFavouriteShoesUseCase:
                  context.read<GetFavouriteShoesUseCase>(),
              addToFavoritesUseCase: context.read<AddToFavoritesUseCase>(),
              removeFromFavoritesUseCase:
                  context.read<RemoveFromFavoritesUseCase>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.ralewayTextTheme(
              Theme.of(context).textTheme, // Ensures default styles are applied
            ),
          ),
          home: const SplashPage(),
        ),
      ),
    );
  }
}
