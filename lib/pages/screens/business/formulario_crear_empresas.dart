import 'package:cocreator/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormCrearEmpresas extends StatefulWidget {
  static const String routeName = '/form-crear-empresas';
  const FormCrearEmpresas({Key? key}) : super(key: key);

  @override
  State<FormCrearEmpresas> createState() => _FormCrearEmpresasState();
}

class _FormCrearEmpresasState extends State<FormCrearEmpresas> {
  final idForm = GlobalKey<FormState>();

  Map<String, dynamic> nuevaempresa = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
              key: idForm,
              child: Column(
                children: [
                  _crearNombre(),
                  _crearEmail(),
                  _crearDireccion(),
                  _crearWebSite(),
                  TextButton(
                      onPressed: (() {
                        idForm.currentState?.save();
                        //EmpresasProvider().agregarEmpresa(nuevaempresa);
                        context.go('/actual-home');
                      }),
                      child: const Text('crear'))
                ],
              )),
        ));
  }

  _crearNombre() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
          style: const TextStyle(color: AppTheme.primary),
          onSaved: ((newValue) {
            nuevaempresa['nombre'] = newValue;
          }),
          decoration: const InputDecoration(
            hintText: 'Nombre',
            hintStyle: TextStyle(color: AppTheme.primary),
          )),
    );
  }

  _crearEmail() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: AppTheme.primary),
        onSaved: (newValue) {
          nuevaempresa['Email'] = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: AppTheme.primary),
        ),
      ),
    );
  }

  _crearDireccion() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: AppTheme.primary),
        onSaved: (newValue) {
          nuevaempresa['Dirección'] = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'Dirección',
          hintStyle: TextStyle(color: AppTheme.primary),
        ),
      ),
    );
  }

  _crearWebSite() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: AppTheme.primary),
        onSaved: (newValue) {
          nuevaempresa['Web Site'] = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'Web Site',
          hintStyle: TextStyle(color: AppTheme.primary),
        ),
      ),
    );
  }
}
