
// Would require clean up and validation in real world
function allPossiblePalindromes(str, state = { palindromes: [] }) {
  if (str.length > 1) {
    if (!state['initial_string']) {
      state['initial_string'] = str;
    }

    // check if the string is a palindrome and modify state correctly
    if (str === str.split('').reverse().join('')) {
      state.palindromes.push(str);
    }
    // javascript passes object by copying their Reference, so we can leverage on this to keep track of the state
    // find all possible palindromes by removing from the end of the string (till we have one letter)
    allPossiblePalindromes(str.slice(0, str.length - 1), state);

    // coming out of the stack of the initial string, we want to make the initial string now start from the next letter till the end
    state['initial_string'] = state['initial_string'].slice(1, state['initial_string'].length); // Second level of recursion is using the same address in memory instead of copying into a new memory address every single time.

    allPossiblePalindromes(state['initial_string'], state);
  }

  // destructure the palindromes from the state after execution all the stacks.
  return state.palindromes;
}

console.log(allPossiblePalindromes('aabcaacdadsaewawtt'));

// Don't exceed Node js stack size of  11034, to check when string has exceeded it ? use stringslength * stringslength i.e. Max words to compute is 105 in node js. After clean up, the string below is 98 in length
console.log(allPossiblePalindromes("DennisNellEdnaLeonNedraAnitaRolfNoraAliceCarolLeoJaneReedDenaDaleBasilRaePennyLanaDaveDennyLenaIda"));