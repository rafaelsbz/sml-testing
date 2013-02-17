fun assert_equals (expected, actual, formatter) =
    if expected = actual then " -- PASS"
    else "Expected '" ^ formatter (expected) ^ "' but got '" ^ formatter (actual) ^ "' -- FAIL"
											

fun assert_equals_bool (expected, actual) = assert_equals(expected, actual, Bool.toString)
fun assert_true (actual) = assert_equals_bool(true, actual)
fun assert_false (actual) = assert_equals_bool(false, actual)
					     
fun assert_raises (f, e) =
    (f(); "No " ^ exnName (e) ^ " was raised -- FAIL") 
    handle e' => if exnName e = exnName e' then " -- PASS"
		 else "Wrong exception raised: " ^ exnName (e') ^ " -- FAIL"
											
