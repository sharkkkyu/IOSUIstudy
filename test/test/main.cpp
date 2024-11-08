#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <map>
#include <algorithm>
#include <cmath>

using namespace std;

// Function to parse the polynomial string into coefficients
vector<int> parsePolynomial(const string& poly) {
    vector<int> coefficients;
    string modifiedPoly = poly;
    // Replace "-" with "+-" to simplify splitting
    for (size_t i = 0; i < modifiedPoly.size(); ++i) {
        if (modifiedPoly[i] == '-' && i > 0) {
            modifiedPoly.insert(i, "+");
            ++i;
        }
    }

    stringstream ss(modifiedPoly);
    string term;
    while (getline(ss, term, '+')) {
        int coeff = 1, power = 0;
        size_t xPos = term.find('x');
        if (xPos != string::npos) {
            if (xPos > 0) {
                coeff = stoi(term.substr(0, xPos));
            }
            size_t powerPos = term.find('^');
            if (powerPos != string::npos) {
                power = stoi(term.substr(powerPos + 1));
            } else {
                power = 1;
            }
        } else {
            coeff = stoi(term);
        }
        if (coefficients.size() <= power) {
            coefficients.resize(power + 1, 0);
        }
        coefficients[power] = coeff;
    }
    reverse(coefficients.begin(), coefficients.end());
    return coefficients;
}

// Function to find the roots of the polynomial
vector<int> findRoots(const vector<int>& coefficients) {
    vector<int> roots;
    int a0 = coefficients.back();
    int an = coefficients.front();
    for (int i = -abs(a0); i <= abs(a0); ++i) {
        if (i == 0) continue;
        if (a0 % i == 0) {
            int value = 0;
            for (int j = 0; j < coefficients.size(); ++j) {
                value = value * i + coefficients[j];
            }
            if (value == 0) {
                roots.push_back(i);
            }
        }
    }
    return roots;
}

// Function to construct the factorized form
string constructFactorizedForm(const vector<int>& roots) {
    map<int, int> factors;
    for (int root : roots) {
        factors[root]++;
    }
    string result;
    for (const auto& factor : factors) {
        if (!result.empty()) {
            result += "";
        }
        if (factor.first < 0) {
            result += "(x+" + to_string(-factor.first) + ")";
        } else {
            result += "(x-" + to_string(factor.first) + ")";
        }
        if (factor.second > 1) {
            result += "^" + to_string(factor.second);
        }
    }
    return result;
}

int main() {
    string polynomial;
    cout << "Enter the polynomial: ";
    getline(cin, polynomial);
    vector<int> coefficients = parsePolynomial(polynomial);
    vector<int> roots = findRoots(coefficients);
    string factorizedForm = constructFactorizedForm(roots);
    cout << "Factorized form: " << factorizedForm << endl;
    return 0;
}
