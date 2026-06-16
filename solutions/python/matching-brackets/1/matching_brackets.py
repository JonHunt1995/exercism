def is_paired(input_string):
    stack = []
    matches = {
        "{": "}",
        "[": "]",
        "(": ")"
    }

    for letter in input_string:
        if letter not in "()[]{}":
            continue 
        if not stack and letter in matches.values():
            return False
        if letter in matches.keys():
            stack.append(letter)
            continue 
        if matches[stack[-1]] != letter:
            return False
            
        stack.pop()
        
    return not stack