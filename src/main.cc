#define CPPHTTPLIB_OPENSSL_SUPPORT

#include <iostream>

#include "httplib.h"


int main(int argc, char** argv) {
    httplib::Client client("httpbin.org", 80);

    auto res = client.Get("/");
    std::cout << res->status << std::endl;
    if (res && res->status == 200) {
        std::cout << res->body << std::endl;
    }
}