import 'package:bank_sat/shared/theme.dart';
import 'package:bank_sat/ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:bank_sat/ui//pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_overview.png",
                width: 20,
                color: blueColor,
              ),
              label: "Ikhtisar",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_history.png",
                width: 20,
              ),
              label: "Riwayat",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_edit_profile.png",
                width: 20,
              ),
              label: "Profil",
            ),
          ],
          onTap: (int index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            buildProfile(context),
            buildWalletCard(),
            buildServices(context),
            buildLatestTransactions(),
            buildSendAgainSection(),
          ],
        ),
      ),
    );
  }
}

Widget buildProfile(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hai,",
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "Daulah",
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/profile"),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/img_profile.png"),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    size: 16,
                    color: greenColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildWalletCard() {
  return Container(
    width: double.infinity,
    height: 220,
    margin: const EdgeInsets.only(
      top: 30,
    ),
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/img_bg_card.png"),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DAULAH EL ISLAMI",
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "**** **** **** 4992",
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
            letterSpacing: 5,
          ),
        ),
        const Spacer(),
        Text(
          "Saldo",
          style: whiteTextStyle,
        ),
        Text(
          "Rp 144.500.000",
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      ],
    ),
  );
}

Widget buildServices(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bank SAT",
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeServiceItem(
              iconUrl: "assets/ic_topup.png",
              title: "Isi Saldo",
              onTap: () {
                Navigator.pushNamed(context, "/topup");
              },
            ),
            HomeServiceItem(
              iconUrl: "assets/ic_send.png",
              title: "Kirim",
              onTap: () {
                Navigator.pushNamed(context, "/transfer");
              },
            ),
            HomeServiceItem(
              iconUrl: "assets/ic_qris.png",
              title: "Kode Bayar",
              onTap: () {},
            ),
            HomeServiceItem(
              iconUrl: "assets/ic_more.png",
              title: "Lainnya",
              onTap: () {},
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildLatestTransactions() {
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transaksi Terbaru",
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 14,
          ),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: const Column(
            children: [
              HomeTransactionItem(
                title: "Isi Saldo",
                iconUrl: "assets/ic_transaction_cat1.png",
                time: "Kemarin",
                value: "+ 450.000",
              ),
              HomeTransactionItem(
                title: "Cashback",
                iconUrl: "assets/ic_transaction_cat2.png",
                time: "Nov 11",
                value: "+ 22.000",
              ),
              HomeTransactionItem(
                title: "Tarik",
                iconUrl: "assets/ic_transaction_cat3.png",
                time: "Nov 2",
                value: "- 5.000",
              ),
              HomeTransactionItem(
                title: "Transfer",
                iconUrl: "assets/ic_transaction_cat4.png",
                time: "Okt 27",
                value: "- 123.500",
              ),
              HomeTransactionItem(
                title: "Listrik",
                iconUrl: "assets/ic_transaction_cat5.png",
                time: "Okt 18",
                value: "- 90.000",
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildSendAgainSection() {
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kirim Lagi",
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeUserItem(
                userName: "Siti",
                url: "assets/img_friend1.png",
              ),
              HomeUserItem(
                userName: "Eulis",
                url: "assets/img_friend2.png",
              ),
              HomeUserItem(
                userName: "Epul",
                url: "assets/img_friend3.png",
              ),
              HomeUserItem(
                userName: "Wahyu",
                url: "assets/img_friend4.png",
              ),
            ],
          ),
        )
      ],
    ),
  );
}
