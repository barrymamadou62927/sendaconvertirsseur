import 'package:flutter/material.dart';

void main() => runApp(const SendaConvertApp());

class SendaConvertApp extends StatelessWidget {
  const SendaConvertApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SendaConvert',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _expression = '0';
  String _base = 'GNF';

  final Map<String, double> _rates = {
    'GNF': 8770, 'USD': 1, 'XOF': 590, 'EUR': 0.92, 'CDF': 2800,
  };

  final List<Map<String, String>> _currencies = [
    {'code': 'GNF', 'flag': '🇬🇳', 'name': 'Franc guinéen'},
    {'code': 'USD', 'flag': '🇺🇸', 'name': 'Dollar américain'},
    {'code': 'XOF', 'flag': '🇨🇮', 'name': 'Franc CFA'},
    {'code': 'EUR', 'flag': '🇪🇺', 'name': 'Euro'},
    {'code': 'CDF', 'flag': '🇨🇩', 'name': 'Franc congolais'},
  ];

  double get _value {
    try { return double.parse(_expression.replaceAll(',', '.')); }
    catch (_) { return 0; }
  }

  String _convert(String to) {
    final r = (_value / (_rates[_base] ?? 1)) * (_rates[to] ?? 1);
    return r == r.truncateToDouble() ? r.toInt().toString() : r.toStringAsFixed(2);
  }

  void _tap(String k) {
    setState(() {
      if (k == 'C') { _expression = '0'; return; }
      if (k == '⌫') {
        _expression = _expression.length > 1
             ? _expression.substring( 0, _expression.length - 1) : '0';
        return;
      }
      _expression = _expression == '0' ? k : _expression + k;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F10),
      body: SafeArea(child: Column(children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
          child: Row(children: [
            RichText(text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'Senda', style: TextStyle(color: Color(0xFFF0F0F0))),
                TextSpan(text: 'Convert', style: TextStyle(color: Color(0xFFF5A623))),
              ],
            )),
            const Spacer(),
            const Text('💱', style: TextStyle(fontSize: 22)),
          ]),
        ),

        // Devises
        Expanded(child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: _currencies.map((c) {
            final code = c['code']!;
            final isBase = code == _base;
            return GestureDetector(
              onTap: () => setState(() {
                _expression = _convert(code);
                _base = code;
              }),
              child: Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1E),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isBase ? const Color(0xFFF5A623) : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Row(children: [
                  Text(c['flag']!, style: const TextStyle(fontSize: 26)),
                  const SizedBox(width: 12),
                  Text(code, style: const TextStyle(
                    color: Color(0xFFF0F0F0), fontSize: 14, fontWeight: FontWeight.w600,
                  )),
                  const Spacer(),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(
                            isBase ? _expression : _convert(code),      
                      style: TextStyle(
                        color: isBase ? const Color(0xFFF5A623) : const Color(0xFFF0F0F0),
                        fontSize: 20, fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(c['name']!, style: const TextStyle(
                      color: Color(0xFF6A6A70), fontSize: 10,
                    )),
                  ]),
                ]),
              ),
            );
          }).toList(),
        )),

        // expression
 Padding ( 
 Padding : 20, verticale : 6),
   Enfant : align (   
   alignement : Alignement.centreDroit,   
    enfant : Texte (_expression, style : Const. TextStyle (  
      Couleur : couleur (      0xF0F0F0), fontSize : 32, fontWeight : FontWeight.w300,
 )), 
 ), 
 ), 

        // Clavier
 Padding ( 
 Padding : 12, 0, 12, 16),
   Enfant : colonne (enfants : [   
               pour (Finale. Rôle. dans [   
 [ '7','8','9','s],'7','8','9','s'],
 [ ],4','5','6',' x'],[ '4','5','6','x',
],'1', [ ,'3','-'],1','2','3,-'],
,[  [ ' [ ','0','?','+'],,'0','?,+,
,
 Padding ( 
   Paiement :   const. EdgeInsets.only (en bas : ],. EdgeInsets.only (en bas : 8), const. EdgeInsets.only (en bas : const. EdgeInsets.only (en bas : 8), const. EdgeInsets.only (en bas : const. EdgeInsets.only (en bas : 8), const. EdgeInsets.only (en bas : const. EdgeInsets.only (en bas : 8), 
 enfant : Row (enfants : row.map ((k) { 
                        Finale. est op = [   Finale. est op = [     ',. EdgeInsets.only (en bas : ','),') -','+']. contient (k) ; 's.','x)']. contient (k) ; '-','+']. contient (k) ; 's.','x)']. contient (k) ; '-','+','s.','x)']. contient (k) ; '-','+', ',. EdgeInsets.only (en bas : ','),') -','+']. contient (k) ; 's.','x)']. contient (k) ; '-','+']. contient (k) ; 's.','x)']. contient (k) ; '-','+','s.','x)']. contient (k) ; '-','+', 
                                             ,]. contient (k) ; ?,,]. contient (k) ; ?, ',?,]. contient (k) ; ?est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  cFinale. est FUNC = [                         Finale. est FUNC = [    ]. contient (k) ;  c]. contient (k) ; ',?,]. contient (k) ; ?est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  cFinale. est FUNC = [                         Finale. est FUNC = [    ]. contient (k) ;  c]. contient (k) ;
                                          Retour. Agrandi (enfant : rembourrage (       
  Padding : Padding : 4                      Retour. Agrandi (enfant : rembourrage (      4),4,?,]. contient (k) ; ?est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  cFinale. est FUNC = [                         Finale. est FUNC = [    ]. contient (k) ;  c]. contient (k) ;4 ),                     Retour. Agrandi (enfant : rembourrage (      4),4,?,]. contient (k) ; ?est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  cFinale. est FUNC = [                         Finale. est FUNC = [    ]. contient (k) ;  c]. contient (k) ;4),
                        Retour. Agrandi (enfant : rembourrage (    Enfant : GestureDetector (        enfant : rembourrage (    Retour. Agrandi (enfant : rembourrage (    Enfant : GestureDetector (        Retour. Agrandi (enfant : rembourrage (    Enfant : GestureDetector  (        Retour. Agrandi (enfant : rembourrage (    Retour. Agrandi (enfant : rembourrage (    Enfant : GestureDetector (       (enfant : rembourrage (    Enfant : GestureDetector (       Retour. Agrandi    (enfant : rembourrage (            Enfant : GestureDetector (       Enfant : GestureDetector (            
              Enfant : GestureDetector (       Enfant : GestureDetector (             
    Enfant : conteneur (        Enfant : conteneur (        couleur : est-ce que c         '
  Enfant : GestureDetector (       Enfant : GestureDetector (           Hauteur :        Hauteur :        Enfant : GestureDetector (       ,  Retour. Agrandi (enfant : rembourrage (    ,     
             Décoration : BoxDecoration (           Décoration : BoxDecoration (           Décoration : BoxDecoration (            
                couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(         couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(          couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(         couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(          0xFFF5A623) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623) couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(         couleur : est-ce que cconst Color(        couleur : est-ce que cconst Color(         0xFFF5A623)  0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)) 0xFFF5A623) 0xFFF5A623) 0xFFF5A623)
                 : est-ce que c            : est-ce que c            ''const''''const   : est-ce que c         const    : est-ce que c          0xFF1A1A1E) '   : est-ce que c         const    : est-ce que c          0xFF1A1A1E) '           : est-ce que c       Color( 0xFF1A1A1E)est du fun ?  const Couleur (0xFF1A1A1E) '     est du fun ?       const Color(0xFF1A1A1E     )est du fun ?       const Color(0xFF1A1A1E) 'est du fun ?  const Couleur (0xFF1A1A1E)est du fun ?  const Couleur (0xFF1A1A1E) '''    est du fun ?      const Color(0xFF1A1A1E    )est du fun ?      const Color(0xFF1A1A1E)const Color(0xFF1A1A1E    )es : est-ce que c            ''const''const    : est-ce que c          const     : est-ce que c           0xFF1A1A1E) '           : est-ce que c       Color( 0xFF1A1A1E)est du fun ?  const Couleur (0xFF1A1A1E) '      est du fun ?        const Color(0xFF1A1A1E      )est du fun ?        const Color(0xFF1A1A1E) 'est du fun ?  const Couleur (0xFF1A1A1E)est du fun ?  const Couleur (0xFF1A1A1E) ''''''   est du fun ?     const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?     const Color(0xFF1A1A1E)const Color(0xFF1A1A1E   )est du fun ?      const Color(0xFF1A1A1E) 
  : couleur  : couleur const (0xFF2428),
    : couleur  est du fun ?       
        est du fun ?         est du fun ?         
             Alignement : Alignement.Centre,  Alignement : Alignement.Centre,            Alignement : Alignement.Centre,  Alignement : Alignement.Centre,            
                     Alignement : Alignement.Centre,  Alignement : Alignement.Centre,              Alignement : Alignement.Centre,  Alignement : Alignement.Centre,              
                   enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(                         Alignement : Alignement.Centre,         Alignement : Alignement.Centre,                          Alignement : Alignement.Centre,  Alignement : Alignement.Centre,            st ? Couleurs.blanc : color: isOp ? Colors.white : ), Color( enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(      ''0xFFF0F0F0est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color('0xFFF0F0F0s       t ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(       ' enfant : Texte (k, style : TextStyle (  '0xFFF0F0F0st ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(  enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(       ' enfant : Texte (k, style : TextStyle ( child: Text(k, style: TextStyle(    0xFFF0F0F0),0xFFF0F0F0), '0xFFF0F0F0),0xFFF0F0F0), 'est ? Couleurs.blanc : color: isOp ? Colors.white : ), Color(0xFFF0F0F0),'''
 fontSize : 20, fontWeight : FontWeight.w500,
             Alignement : Alignement.Centre,     Alignement : Alignement.Centre,     Alignement : Alignement.Centre,             
                  Alignement : Alignement.Centre,     Alignement : Alignement.Centre,     Alignement : Alignement.Centre,               
    ), Alignement : Alignement.Centre,     Alignement : Alignement.Centre,     Alignement : Alignement.Centre,              
 )); 
 }).toList ()), 
 ), 
 ]), 
 ), 
 ])), 
 ); 
 } 
        }
