import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';
import 'package:vtb_hack/features/core_widgets/custom_checkbox.dart';
import 'package:vtb_hack/features/filter_page/bloc/filter_page_bloc.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key, required this.requestFromPrevPage});
  final DepartmentRequest requestFromPrevPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterPageBloc(
        requestFromPrevPage: requestFromPrevPage,
        pageState: const PageState(),
      ),
      child: BlocConsumer<FilterPageBloc, FilterPageState>(
        listener: (context, state) {
          if (state is FilterPageAllowedToPop) {
            Navigator.of(context).pop(state.pageState.request);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Фильтр поиска',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            backgroundColor: const Color(0xFFF3F7FA),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () => context.read<FilterPageBloc>().add(FilterPageSubmit()),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(const Color(0xFF0184FE)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'Применить',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () => context.read<FilterPageBloc>().add(FilterPageClear()),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(color: Color(0xFF0184FE), width: 1.5)),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'Сбросить',
                          style: TextStyle(
                            color: Color(0xFF0184FE),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ))),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Выберите желаемую услугу:',
                    style: TextStyle(
                      color: Color(0xFF1A1D22),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCheckBox(
                          value: state.pageState.cardCheck,
                          onTap: () => context.read<FilterPageBloc>().add(FilterPageCheckCard()),
                          text: 'Оформить карту',
                        ),
                        const SizedBox(height: 20),
                        CustomCheckBox(
                          value: state.pageState.indPerCheck,
                          onTap: () => context.read<FilterPageBloc>().add(FilterPageCheckIndPer()),
                          text: 'Открыть ИП',
                        ),
                        const SizedBox(height: 20),
                        CustomCheckBox(
                          value: state.pageState.creditCheck,
                          onTap: () => context.read<FilterPageBloc>().add(FilterPageCheckCredit()),
                          text: 'Оформить кредит',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Радиус поиска:',
                        style: TextStyle(
                          color: Color(0xFF1A1D22),
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${state.pageState.sliderValue.toInt().toString()} км',
                        style: const TextStyle(
                          color: Color(0xFF1A1D22),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xFF1A1D22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40 - 40 - 27,
                              child: Slider(
                                min: 1,
                                max: 50,
                                divisions: 50,
                                value: state.pageState.sliderValue,
                                thumbColor: Colors.grey.shade100,
                                activeColor: const Color(0xFF0184FE),
                                inactiveColor: Colors.grey.shade100,
                                onChanged: (double value) => context
                                    .read<FilterPageBloc>()
                                    .add(FilterPageChangeRadius(value)),
                              ),
                            ),
                            const Text(
                              '50',
                              style: TextStyle(
                                color: Color(0xFF1A1D22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomCheckBox(
                      value: state.pageState.freeDepartments,
                      onTap: () =>
                          context.read<FilterPageBloc>().add(FilterPageCheckFreeDepartments()),
                      text: 'Наименее загруженные',
                    ),
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
