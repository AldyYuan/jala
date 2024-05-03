import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jala/core/injection/injection.dart';
import 'package:jala/core/widgets/verification_status_chip.dart';
import 'package:jala/presentation/shrimp_price_detail/bloc/shrimp_price_detail_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShrimpPriceDetailPage extends StatelessWidget {
  final int id;
  const ShrimpPriceDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShrimpPriceDetailBloc>(
      create: (context) => ShrimpPriceDetailBloc(getIt())..add(ShrimpPriceDetailGet(id: id)),
      child: BlocBuilder<ShrimpPriceDetailBloc, ShrimpPriceDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Harga Udang"),
              actions: [
                IconButton(
                  onPressed: () {
                    Share.shareUri(Uri.parse("https://app.jala.tech/shrimp_prices/${state.data?.id}"));
                  },
                  icon: const Icon(Icons.share_rounded),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Loading
                  if (state.status == ShrimpPriceDetailStatus.initial || state.status == ShrimpPriceDetailStatus.loading) const LinearProgressIndicator(),

                  // Failure
                  if (state.status == ShrimpPriceDetailStatus.failure) const Text("Something went wrong!"),

                  // Success
                  if (state.status == ShrimpPriceDetailStatus.success)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text(
                                state.data?.region.provinceName ?? "",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                state.data?.region.name ?? "",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),

                        // Divider
                        const Divider(),

                        // Body
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date & Verification
                              Row(
                                children: [
                                  // Date
                                  Text(
                                    DateFormat("dd MMMM yyyy", 'id_ID').format(DateTime.parse(state.data?.date ?? "")),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Verification
                                  VerificationStatusChip(isVerified: state.data?.creator?.buyer ?? false),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Supplier Detail
                              Row(
                                children: [
                                  // Supplier
                                  CircleAvatar(
                                    backgroundImage:
                                        state.data?.creator == null ? null : NetworkImage("https://app.jala.tech/storage/${state.data?.creator!.avatar}"),
                                    radius: 24,
                                  ),
                                  const SizedBox(width: 8),

                                  // Name
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Supplier',
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                        Text(
                                          state.data?.creator?.name ?? '-',
                                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                color: Theme.of(context).colorScheme.onSurface,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Supplier Contact
                              Row(
                                children: [
                                  // Contact
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kontak',
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                        Text(
                                          state.data?.creator?.phone ?? '-',
                                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                color: Theme.of(context).colorScheme.onSurface,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Call
                                  const SizedBox(width: 8),
                                  FilledButton(
                                    onPressed: () async {
                                      Uri url = Uri.parse("tel:${state.data?.creator?.phone ?? '-'}");

                                      if (!await launchUrl(url)) {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong!")));
                                      }
                                    },
                                    child: const Text("Hubungi"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Pricelist
                              Text(
                                "Daftar Harga",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),

                              for (int size = 20; size <= 200; size += 10) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Size $size",
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: state.data?.region.countryId.toLowerCase(),
                                          symbol: 'Rp ',
                                          decimalDigits: 0,
                                        ).format(state.data?.getSizeByFilter(size)),
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              const SizedBox(height: 16),

                              // Note
                              Text(
                                "Catatan",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
