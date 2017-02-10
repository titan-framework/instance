# Titan Framework

About
-----

Titan is a framework for instantiation of content management systems (CMS), allowing the creation of complex web applications. The **Titan Framework** proposal is to be a simple and complete development tool, allowing you to create robust applications quickly and easily.

Titan was developed and is maintained by the partnership between the [Software Engineering Laboratory (LEDES)](http://www.ledes.net) of the [Faculty of Computing (FACOM)](http://www.facom.ufms.br) of the [Federal University of Mato Grosso do Sul (UFMS)](http://www.ufms.br) and the [Laboratory for Precision Livestock, Environment and Software Engineering (PLEASE Lab)](http://please.cnpgc.embrapa.br) of the [Embrapa Beef Cattle](http://www.embrapa.br/gado-de-corte) of the [Brazilian Agricultural Research Corporation (Embrapa)](http://www.embrapa.br).

Getting Started
---------------

To create your project, use [Composer](http://getcomposer.org):

```bash
php composer.phar create-project titan-framework/instance path/to/local/folder
```

After install, start Vagrant box to run your application:

```bash
cd path/to/local/folder
vagrant up
```

Your Titan instance is running at **http://localhost:8090**. To access, use "**admin**" as login and password.

All mail messages is getted by [MailHog](https://github.com/mailhog/MailHog), and you can access at **http://localhost:8025**.

Now, you can modify the base-code to implement your requirements.

More Information
----------------

Read [official documentation](http://www.titanframework.com/docs/preface/) and [Titan Cookbook](https://github.com/titan-framework/docs/raw/master/Cookbook.pdf) (*in portuguese*) are the best ways to start using it. Access our [mailing list](https://groups.google.com/forum/#!forum/titan-framework) to learn advanced features and answer questions.

Troubleshoot
------------

* If after "vagrant up" you receive a error of Titan's CORE not found, try pause your antvirus, destroy VM (with "vagrant destroy") and make up again (I had problems with Kaspersky).
