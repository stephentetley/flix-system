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

package spt.sandobox

import ca.uwaterloo.flix.util.{FlixTest, Options}
import org.scalatest.Suites

class TestSandbox extends Suites(
  // Data
  new FlixTest("TestDList", "main/test/spt/sandbox/TestDList.flix")(Options.TestWithLibrary),
  new FlixTest("TestJoinList", "main/test/spt/sandbox/TestJoinList.flix")(Options.TestWithLibrary),
  new FlixTest("TestRoseTree", "main/test/spt/sandbox/TestRoseTree.flix")(Options.TestWithLibrary),
  // Regex
  new FlixTest("TestPattern", "main/test/spt/sandbox/TestPattern.flix")(Options.TestWithLibrary),
  // System
  new FlixTest("System/TestEnvironment", "main/test/spt/sandbox/System/TestEnvironment.flix")(Options.TestWithLibrary),
  new FlixTest("System/TestFilePath", "main/test/spt/sandbox/System/TestFilePath.flix")(Options.TestWithLibrary),

)