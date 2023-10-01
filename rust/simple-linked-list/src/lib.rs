use std::fmt::{Display, Formatter};
use std::iter::FromIterator;

#[derive(Debug)]
pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T: Display> Node<T> {
    /*
    pub fn len(&self) -> usize {
        match self.next {
            None => 1,
            Some(node) => 1 + node.take().next.len(),
        }
    }
     */

    pub fn push(&mut self, _element: T) {
        match &mut self.next {
            None => {
                self.next = Some(Box::new(Node {
                    data: _element,
                    next: None,
                }));
            },
            Some(node) => {
                node.push(_element);
            }
        }
    }

    /*
    pub fn pop_next(&mut self) -> Option<T> {
        match self.next.take() {
            None => None,
            Some(mut next_node) => {
                self.next = next_node.next.take();
                Some(next_node.data)
            }
        }
    }
     */

    pub fn pop_next(&mut self) -> Option<T> {
        match self.next.take() {
            None => {
                None
            },
            Some(mut next_node) => {
                match &next_node.next {
                    // when next_node is the last, pop it
                    None => {
                        println!("pop: {}", next_node.data);
                        self.next = None;
                        Some(next_node.data)
                    },
                    // search next next
                    Some(_) => {
                        next_node.pop_next()
                    }
                }
            }
        }
    }

    // Try another impl
    /*
    pub fn pop(&mut self) {
        match &self.next {
            None => {
                //
                self.data =
            },
            Some(node) => {
                node.pop();
            }
        }
    }

    fn _pop(&mut self, prev: &mut self) {

    }
     */
}

#[derive(Debug)]
pub struct SimpleLinkedList<T> {
    // Box stores the Node in the heap memory
    head: Option<Box<Node<T>>>,
}

impl<T: Display> Display for Node<T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.data)?;
        if let Some(ref next) = self.next {
            write!(f, " -> {}", next)?;
        }
        Ok(())
    }
}

impl<T: Display> Display for SimpleLinkedList<T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        if let Some(ref head) = self.head {
            write!(f, "{}", head)
        } else {
            write!(f, "Empty LinkedList")
        }
    }
}

impl<T: Display> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: None }
    }

    // You may be wondering why it's necessary to have is_empty()
    // when it can easily be determined from len().
    // It's good custom to have both because len() can be expensive for some types,
    // whereas is_empty() is almost always cheap.
    // (Also ask yourself whether len() is expensive for SimpleLinkedList)
    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }

    /*
    pub fn len(&self) -> usize {
        match &self.head {
            None => 0,
            Some(node) => {
                let mut tmp: &Box<Node<T>> = node;
                let mut count = 1;
                while let Some(next_node) = &tmp.next {
                    tmp = &next_node;
                    count += 1;
                }
                count
            },
        }
    }
     */

    // Another implementation of len()
    pub fn len(&self) -> usize {
        let mut count = 0;
        let mut current = &self.head;
        println!("{}", if current.is_none() { "None" } else { "Some" });
        while let Some(node) = current {
            count += 1;
            current = &node.next;
        }
        count
    }

    pub fn push(&mut self, _element: T) {
        match &mut self.head {
            None => {
                self.head = Some(Box::new(Node {
                    data: _element,
                    next: None,
                }));
            }
            Some(node) => {
                node.push(_element);
            }
        }
    }

    /*
    pub fn pop(&mut self) -> Option<T> {
        self.head.as_mut().and_then(|node| node.pop_next())
    }
     */

    pub fn pop(&mut self) -> Option<T> where T: Copy {
        let mut current: &mut Option<Box<Node<T>>> = &mut self.head;
        loop {
            // println!("curr: {:?}", current);
            match current {
                None => {
                    return None;
                }
                Some(node) if node.next.is_none() => {
                    let val = node.data;
                    *current = node.next.take();
                    return Some(val);
                }
                Some(ref mut node) => {
                    current = &mut node.next;
                }
            }
        }
    }

    /*
    pub fn pop(&mut self) -> Option<T> {
        match &mut self.head {
            None => None,
            Some(headNode) => {
                match &headNode.next {
                    None => {
                        self.head = None;
                        None
                        // Some(headNode.data)
                    },
                    Some(headNextNode) => {
                        let mut cur = &headNode;
                        let mut next = &headNextNode;
                        while let Some(nextNext) = &next.next {
                            cur = &mut next;
                            next = nextNext;
                        }
                        cur.next = None;
                        Some(next.data)
                    }
                }
            }
        }
    }
    */

    /*
    pub fn pop(&mut self) -> Option<T> {
        match self.head.take() {
            // case1. length 0
            None => None,
            Some(mut headNode) => {
                match &headNode.next {
                    // case2. length 1 => pop head
                    None => {
                        self.head = None;
                        Some(headNode.data)
                    },
                    // case3. length >= 2
                    Some(_) => {
                        headNode.pop_next()
                    }
                }
            }
        }
    }
     */

    pub fn peek(&self) -> Option<&T> {
        match &self.head {
            None => None,
            Some(head_node) => {
                let mut cur = head_node;
                while let Some(next) = &cur.next {
                    cur = &next;
                }
                Some(&cur.data)
            }
        }
    }

    #[must_use]
    pub fn rev(self) -> SimpleLinkedList<T> where T: Copy {
        let mut list = SimpleLinkedList::new();
        let mut list2 = SimpleLinkedList::new();

        let mut current: &Option<Box<Node<T>>> = &self.head;
        loop {
            // println!("curr: {:?}", current);
            match current {
                None => {
                    break;
                },
                Some(node) => {
                    current = &node.next;
                    list.push(node.data);
                }
            }
        }

        /*
        match &self.head {
            None => {},
            Some(head_node) => {
                let mut cur = &Some(head_node);
                while let Some(node) = cur {
                    list.push(node.data);
                    cur = &node.next;
                }
            }
        }
         */

        while let Some(x) = list.pop() {
            list2.push(x);
        }
        list2
    }
}

impl<T: Display> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        let mut list = SimpleLinkedList::new();
        for item in _iter {
            list.push(item);
        }
        list
    }
}

// In general, it would be preferable to implement IntoIterator for SimpleLinkedList<T>
// instead of implementing an explicit conversion to a vector. This is because, together,
// FromIterator and IntoIterator enable conversion between arbitrary collections.
// Given that implementation, converting to a vector is trivial:
//
// let vec: Vec<_> = simple_linked_list.into_iter().collect();
//
// The reason this exercise's API includes an explicit conversion to Vec<T> instead
// of IntoIterator is that implementing that interface is fairly complicated, and
// demands more of the student than we expect at this point in the track.

impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut _linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut v = vec![];
        let mut current: Option<Box<Node<T>>> = _linked_list.head;
        loop {
            // println!("curr: {:?}", current);
            match current {
                None => {
                    break;
                },
                Some(node) => {
                    current = node.next;
                    v.push(node.data);
                }
            }
        }
        v
    }
}
