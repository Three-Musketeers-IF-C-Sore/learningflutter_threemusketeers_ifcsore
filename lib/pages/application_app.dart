import 'dart:async';

import 'package:flutter/material.dart';

class ApplicationApp extends StatefulWidget {
  const ApplicationApp({super.key});

  @override
  State<ApplicationApp> createState() => _ApplicationAppState();
}

class _ApplicationAppState extends State<ApplicationApp> {
  double _value = 0;
  final double _min = 0;
  final double _max = 100;
  bool _isDownload = true;
  bool _isUninstall = false;
  bool _isLoading = false;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            children: [
              ListTile(
                title: const Text('WhatsApp'),
                leading: Tooltip(
                  message: "WhatsApp",
                  child: Image.asset('assets/images/whatsapp.png'), 
                ),
                subtitle: Row(children: const [
                  Icon(Icons.star),
                  Text('4.2'),
                ]),
                trailing: TextButton(    
                  style: !_isLoading ? ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ) : null,       
                  onPressed: (_isDownload) ? 
                             _startDownload:
                             (_isUninstall) ?
                             _uninstall:
                             null,             
                  child: (_isDownload && !_isLoading) ? 
                         const Padding(
                           padding: EdgeInsets.all(3.0),
                           child: Text('Downloads', style: TextStyle(color: Colors.white)),
                         ) :
                         (_isUninstall) ?
                         const Padding(
                           padding: EdgeInsets.all(3.0),
                           child: Text('Uninstall', style: TextStyle(color: Colors.white)),
                         ) :
                         const CircularProgressIndicator()
                ),
              ),
              if (_isLoading) ... [
                Slider(
                  value: _value, 
                  min: _min,
                  max: _max,
                  onChanged: null
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _startDownload() {
    setState(() {
      _isLoading = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _value += 20;
        if (_value >= _max && _isLoading) {
          _value = _max;
          _timer.cancel();
          _isLoading = false;
          _isDownload = false;
          _isUninstall = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Application succesfully installed!'),
            )
          );
        }
      });
    });
    if(!_isLoading) {
      _timer.cancel();
    }
  }

  void _uninstall() {
    setState(() {
      _value = 0;
      _isUninstall = false;
      _isDownload = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application succesfully deleted!'),
        )
      );
    });
  }
}