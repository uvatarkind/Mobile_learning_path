import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _bedTimeEnabled = true;
  bool _alarmEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildSleepNotification(),
                  const SizedBox(height: 24),
                  _buildSleepCalendar(),
                  const SizedBox(height: 24),
                  _buildTimeSettings(),
                  const SizedBox(height: 24),
                  _buildSleepingProblem(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Maya Ramon,',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8189B0),
              ),
            ),
            Row(
              children: [
                Text(
                  'Good Morning ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text(
                  '🌞',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 28),
              onPressed: () {},
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSleepNotification() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDE8FC2).withOpacity(0.5),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF6FF5C2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'You have slept '),
                      TextSpan(
                        text: '09:30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(text: ' that is'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'above your '),
                      TextSpan(
                        text: 'recommendation',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepCalendar() {
    final days = [
      {'name': 'Tue', 'date': '22', 'active': false},
      {'name': 'Wed', 'date': '23', 'active': false},
      {'name': 'Thu', 'date': '24', 'active': true},
      {'name': 'Fri', 'date': '25', 'active': false},
      {'name': 'Sat', 'date': '26', 'active': false},
      {'name': 'Sun', 'date': '27', 'active': false},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Sleep Calendar',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days.map((day) {
            return Column(
              children: [
                Text(
                  day['name'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8189B0),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: day['active'] as bool
                        ? const Color(0xFF091B35)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      day['date'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: day['active'] as bool
                            ? Colors.white
                            : const Color(0xFF091B35),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTimeSettings() {
    return Row(
      children: [
        Expanded(
          child: _buildTimeCard(
            icon: Icons.bed_outlined,
            title: 'Bed time',
            time: '7H and 28Min',
            isEnabled: _bedTimeEnabled,
            onChanged: (value) {
              setState(() {
                _bedTimeEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildTimeCard(
            icon: Icons.access_time,
            title: 'Alarm',
            time: '16H and 18Min',
            isEnabled: _alarmEnabled,
            onChanged: (value) {
              setState(() {
                _alarmEnabled = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeCard({
    required IconData icon,
    required String title,
    required String time,
    required bool isEnabled,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE9FD),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF8189B0),
            ),
          ),
          const SizedBox(height: 8),
          Switch(
            value: isEnabled,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildSleepingProblem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Have a problem',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8189B0),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sleeping?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDE9FD),
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    minimumSize: const Size(0, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Consult an expert',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/sleeping_person.png',
            width: 96,
            height: 96,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFD9DBE7),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, true),
          _buildNavItem(Icons.list, false),
          _buildNavItem(Icons.person_outline, false),
          _buildNavItem(Icons.settings_outlined, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFF8189B0),
        ),
        const SizedBox(height: 4),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
        ),
      ],
    );
  }
}

