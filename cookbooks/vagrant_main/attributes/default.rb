set_unless[:php_pear][:channels] = [
                                     "pear.pdepend.org",
                                     "pear.phpmd.org",
                                    "pear.phpunit.de",
                                    "components.ez.no",
                                    "pear.phpundercontrol.org",
                                    "pear.michelf.com",
                                    "pear.docblox-project.org",
                                    "zend.googlecode.com/svn",
                                     "pear.behat.org"
                              ]
# set_unless[:php_pear][:packages] = ["PHPDocumentor \ PHP_CodeSniffer \ zend/zend \ phpmd/PHP_PMD phpunit/phpcpd phpunit/phploc \ pear/Text_Highlighter-beta \ phpunit/ppw --alldeps phpunit/PHP_CodeBrowser \ pear/HTTP_Request2-beta \ phpunit/PHPUnit_Selenium \ --alldeps phpunit/PHPUnit \ phpunit/PHPUnit_Selenium \ docBlox/DocBlox-beta \ --nodeps MDB2_Driver_mssql; "]
##instalando apenas o necessário por enquanto...
set_unless[:php_pear][:packages] = [
                                     # "PHPDocumentor",
                                     "PHP_CodeSniffer",
                                     "zend/zend",
                                     # "phpmd/PHP_PMD phpunit/phpcpd phpunit/phploc",
                                     # "pear/Text_Highlighter-beta",
                                      # "--alldeps phpunit/PHP_CodeBrowser",
                                     # "pear/HTTP_Request2-beta",
                                     # "phpunit/PHPUnit_Selenium",
                                     "--alldeps phpunit/PHPUnit",
                                     # "docBlox/DocBlox-beta",
                                     "--nodeps MDB2_Driver_mssql"
]
