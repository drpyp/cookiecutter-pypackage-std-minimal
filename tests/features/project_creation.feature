Feature: Project creation
  In order to start my new project as a developper, I want to generate a project structure from a cookiecutter template

  Scenario Outline: Project creation
    Given I am in a working project directory
    When I configure the repository name as <context_repository_name> in the extra context
    And I configure the package name as <context_package_name> in the extra context
    And I configure the package as executable = <is_executable_package>
    And I choose the license <license_type>
    And I generate my project structure with this extra context
    Then The generated parent directory is named <real_repository_name>
    And The package subdirectory is named <real_package_name>
    And The package subdirectory contains an empty subdirectory named resources
    And The package subdirectory contains __init__.py file
    And The package subdirectory contains __main__.py file = <is_executable_package>
    And The documentation subdirectory is named docs
    And The tests subdirectory is named tests
    And The tests resources subdirectory is named resources
    And The scripts subdirectory is named scripts
    And The repository has an README.rst file
    And The repository has a Python compliant .gitignore file
    And The license file correspond to <license_type>

    Examples:
      | context_repository_name        | context_package_name | real_repository_name           | real_package_name            | is_executable_package | license_type                  |
      |                                |                      | package_name[-subpackage_name] | package_name_subpackage_name | No                    | MIT license                   |
      | Package_Name[-Subpackage_Name] |                      | Package_Name[-Subpackage_Name] | package_name_subpackage_name | Yes                   | BSD license                   |
      |                                | my_package           | package_name[-subpackage_name] | my_package                   | No                    | ISC license                   |
      | My Repository                  | my_package           | My Repository                  | my_package                   | Yes                   | Apache Software License 2.0   |
      | My Repository                  | my_package           | My Repository                  | my_package                   | No                    | GNU General Public License v3 |
      | My Repository                  | my_package           | My Repository                  | my_package                   | Yes                   | Not open source               |



