/*
 * Copyright 2020 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

use Data/Transient.{JoinList};

namespace TestJoinList {


/////////////////////////////////////////////////////////////////////////////
// empty                                                                   //
/////////////////////////////////////////////////////////////////////////////

@test
def empty01(): Bool =
    use Data/Transient/JoinList.{toList, empty};
    let xs = empty();
    toList(xs) == Nil

/////////////////////////////////////////////////////////////////////////////
// singleton                                                               //
/////////////////////////////////////////////////////////////////////////////

@test
def singleton01(): Bool =
    use Data/Transient/JoinList.{toList, singleton};
    let xs = singleton(1);
    toList(xs) == 1 :: Nil

@test
def singleton02(): Bool =
    use Data/Transient/JoinList.{toList, singleton};
    let xs: JoinList[Option[Int32]] = singleton(None);
    toList(xs) == None :: Nil

/////////////////////////////////////////////////////////////////////////////
// concat                                                                  //
/////////////////////////////////////////////////////////////////////////////

@test
def concat01(): Bool =
    use Data/Transient/JoinList.{toList, concat};
    let xs = concat(Nil);
    toList(xs) == Nil

@test
def concat02(): Bool =
    use Data/Transient/JoinList.{toList, concat, singleton};
    let xs = concat(singleton(1) :: Nil);
    toList(xs) == 1 :: Nil

@test
def concat03(): Bool =
    use Data/Transient/JoinList.{toList, concat, singleton};
    let xs = concat(singleton(1) :: singleton(2) :: Nil);
    toList(xs) == 1 :: 2 :: Nil

@test
def concat04(): Bool =
    use Data/Transient/JoinList.{toList, concat, singleton, fromList};
    let xs = concat(fromList(1 :: 2 :: Nil) :: singleton(3) :: Nil);
    toList(xs) == 1 :: 2 :: 3 :: Nil

/////////////////////////////////////////////////////////////////////////////
// foldRight                                                               //
/////////////////////////////////////////////////////////////////////////////

@test
def foldRight01(): Bool =
    use Data/Transient/JoinList.{repeat, foldRight};
    let xs = repeat(1, 1000000);
    foldRight((a,b) -> Int32.max(a,b), 0, xs) == 1

/////////////////////////////////////////////////////////////////////////////
// foldLeft                                                                //
/////////////////////////////////////////////////////////////////////////////

@test
def foldLeft01(): Bool =
    use Data/Transient/JoinList.{repeat, foldLeft};
    let xs = repeat(1, 1000000);
    foldLeft((a,b) -> Int32.max(a,b), 0, xs) == 1

/////////////////////////////////////////////////////////////////////////////
// map                                                                     //
/////////////////////////////////////////////////////////////////////////////

@test
def map01(): Bool =
    use Data/Transient/JoinList.{toList, map, empty};
    let xs = map(x -> x+1, empty(): JoinList[Int32]);
    toList(xs) == Nil

@test
def map02(): Bool =
    use Data/Transient/JoinList.{toList, map, singleton};
    let xs = map(x -> x+1, singleton(0));
    toList(xs) == 1 :: Nil


@test
def map03(): Bool =
    use Data/Transient/JoinList.{toList, map, cons, singleton};
    let xs = map(x -> x+1, cons(1, singleton(0)));
    toList(xs) == 2 :: 1 :: Nil

}