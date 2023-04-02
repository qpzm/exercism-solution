extern crate unicode_segmentation;
use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    //return input.chars().rev().collect::<String>();

    /*
    let s = "hello 👋🏽";
    let count = s.graphemes(true).count(); // 7
    println!("Number of graphemes: {}", count);
    */

    input
        // Split the string into an Iterator of &strs, where each element is an
        // extended grapheme cluster.
        .graphemes(true)
        // Reverse the order of the grapheme iterator.
        .rev()
        // Collect all the chars into a new owned String.
        .collect()
}
