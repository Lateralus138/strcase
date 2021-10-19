#pragma once
#ifndef STRINGS_H
#define STRINGS_H
#include <vector>
#include <string>
#include <map>

namespace Strings
{
  struct wrap_data
  {
    std::string left = "";
    std::string right = "";
  };
  struct wrap_data_string
  {
    std::string left = "";
    std::string body = "";
    std::string right = "";
  };
  struct ansi
  {
    std::string ANSI_M = "\x1b[m";
    std::map <std::string, std::string>
    color_map =
    {
      {"fg_black", "\x1b[30m"},
      {"fg_red", "\x1b[31m"},
      {"fg_green", "\x1b[32m"},
      {"fg_yellow", "\x1b[33m"},
      {"fg_blue", "\x1b[34m"},
      {"fg_magenta", "\x1b[35m"},
      {"fg_cyan", "\x1b[36m"},
      {"fg_white", "\x1b[37m"},
      {"fg_light_black", "\x1b[90m"},
      {"fg_light_red", "\x1b[91m"},
      {"fg_light_green", "\x1b[92m"},
      {"fg_light_yellow", "\x1b[93m"},
      {"fg_light_blue", "\x1b[94m"},
      {"fg_light_magenta", "\x1b[95m"},
      {"fg_light_cyan", "\x1b[96m"},
      {"fg_light_white", "\x1b[97m"},
      {"bg_black", "\x1b[40m"},
      {"bg_red", "\x1b[41m"},
      {"bg_green", "\x1b[42m"},
      {"bg_yellow", "\x1b[43m"},
      {"bg_blue", "\x1b[44m"},
      {"bg_magenta", "\x1b[45m"},
      {"bg_cyan", "\x1b[46m"},
      {"bg_white", "\x1b[47m"},
      {"bg_light_black", "\x1b[100m"},
      {"bg_light_red", "\x1b[101m"},
      {"bg_light_green", "\x1b[102m"},
      {"bg_light_yellow", "\x1b[103m"},
      {"bg_light_blue", "\x1b[104m"},
      {"bg_light_magenta", "\x1b[105m"},
      {"bg_light_cyan", "\x1b[106m"},
      {"bg_light_white", "\x1b[107m"}
    };
  };
  std::string string_from_string_vector
  (std::vector <std::string> _string_vector_);
  std::string wrap_string
  (std::string _string_, wrap_data _wrap_data_);
  std::string wrap
  (wrap_data_string _wrap_data_string_);
  void replace_in_string
  (
    std::string & _string_,
    std::string _to_replace_,
    std::string _replace_with_
  );
  void delim_to_vector
  (
    std::vector<std::string> & _vector_,
    std::string _string_,
    char _delim_,
    bool _skip_empty_
  );
};

#endif
