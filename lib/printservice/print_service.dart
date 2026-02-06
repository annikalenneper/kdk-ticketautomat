import 'package:flutter/material.dart';
import 'package:esc_pos_printer_plus/esc_pos_printer_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../printservice/ticket_template.dart';

/// Service zum Suchen und Drucken von Tickets über Bluetooth
class PrintService {
  /// Scannt nach verfügbaren Bluetooth-Druckern
  Stream<List<ScanResult>> scanForPrinters() {
    return FlutterBluePlus.scanResults;
  }

  /// Startet den Scan-Vorgang
  Future<void> startScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
  }

  /// Stoppt den Scan-Vorgang
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  /// Verbindet sich mit einem Drucker und druckt das Ticket
  Future<void> printTicket(BluetoothDevice device, TicketData ticketData) async {
    try {
      // Mit dem Drucker verbinden
      await device.connect();

      // Ticket-Daten erstellen
      final ticketBytes = await buildFinalTicket(ticketData);

      // Drucker-Service initialisieren
      final printer = NetworkPrinter(
        paper: PaperSize.mm58,
        profile: await CapabilityProfile.load(),
      );

      // Ticket drucken
      final PosPrintResult res = await printer.printTicket(ticketBytes);

      // Verbindung trennen
      await device.disconnect();

      if (res == PosPrintResult.success) {
        // Erfolgreich gedruckt
      } else {
        // Fehler beim Drucken
      }
    } catch (e) {
      // Fehler bei der Verbindung oder beim Drucken
    }
  }
}
