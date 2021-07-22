
function allPossiblePalindromes(str, state = {}) {
  if (str.length > 1) {
    if (!state['initial_string']) {
      state['initial_string'] = str;
    }

    // check if the string is a palindrome and modify state correctly
    if (str === str.split('').reverse().join('')) {
      state[str] = true;
    }
    // javascript passes object by copying their Reference, so we can leverage on this to keep track of the state
    // find all possible palindromes by removing from the end of the string (till we have one letter)
    allPossiblePalindromes(str.slice(0, str.length - 1), state);

    // coming out of the stack of the initial string, we want to make the initial string now start from the next letter till the end
    let initialString = state['initial_string'];
    initialString = initialString.slice(1, initialString.length);
    state['initial_string'] = initialString;


    allPossiblePalindromes(initialString, state);
  }

  // destructure the palindromes from the state after execution all the stacks.
  const { initial_string , ...palindromes } = state;
  return { ...palindromes }
}

console.log(allPossiblePalindromes('aabcaacdadsaewawt'));