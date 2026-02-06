import 'package:flutter/material.dart';

/// Standard-Button für den Ticketautomaten
class TicketButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;

  const TicketButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

/// Button mit Dropdown für Haltestellenauswahl
class HaltestellenButton extends StatefulWidget {
  final List<String> haltestellen;
  final Function(String) onHaltestelleSelected;
  final String? initialHaltestelle;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const HaltestellenButton({
    super.key,
    required this.haltestellen,
    required this.onHaltestelleSelected,
    this.initialHaltestelle,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  State<HaltestellenButton> createState() => _HaltestellenButtonState();
}

class _HaltestellenButtonState extends State<HaltestellenButton> {
  String? selectedHaltestelle;

  @override
  void initState() {
    super.initState();
    selectedHaltestelle = widget.initialHaltestelle;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.blue[700],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(64),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedHaltestelle,
          hint: Text(
            'Haltestelle auswählen',
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: widget.textColor ?? Colors.white,
            size: 32,
          ),
          dropdownColor: widget.backgroundColor ?? Colors.blue[700],
          isExpanded: true,
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          items: widget.haltestellen.map((String haltestelle) {
            return DropdownMenuItem<String>(
              value: haltestelle,
              child: Text(haltestelle),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedHaltestelle = newValue;
              });
              widget.onHaltestelleSelected(newValue);
            }
          },
        ),
      ),
    );
  }
}

/// Kombinierter Button mit Haltestellen-Dropdown und Bestätigungs-Button
class HaltestellenAuswahlWidget extends StatefulWidget {
  final List<String> haltestellen;
  final Function(String) onBestaetigen;
  final String? initialHaltestelle;
  final String bestaetigenText;

  const HaltestellenAuswahlWidget({
    super.key,
    required this.haltestellen,
    required this.onBestaetigen,
    this.initialHaltestelle,
    this.bestaetigenText = 'Bestätigen',
  });

  @override
  State<HaltestellenAuswahlWidget> createState() =>
      _HaltestellenAuswahlWidgetState();
}

class _HaltestellenAuswahlWidgetState extends State<HaltestellenAuswahlWidget> {
  String? selectedHaltestelle;

  @override
  void initState() {
    super.initState();
    selectedHaltestelle = widget.initialHaltestelle;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HaltestellenButton(
          haltestellen: widget.haltestellen,
          onHaltestelleSelected: (haltestelle) {
            setState(() {
              selectedHaltestelle = haltestelle;
            });
          },
          initialHaltestelle: widget.initialHaltestelle,
        ),
        const SizedBox(height: 16),
        TicketButton(
          text: widget.bestaetigenText,
          icon: Icons.check_circle,
          backgroundColor: selectedHaltestelle != null
              ? Colors.green[600]
              : Colors.grey[400],
          onPressed: selectedHaltestelle != null
              ? () => widget.onBestaetigen(selectedHaltestelle!)
              : () {},
        ),
      ],
    );
  }
}
