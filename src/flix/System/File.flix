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

use System.FilePath;
use System.FilePath.{FilePath};
use Text.Charset.{Charset};

namespace System/File {

    /// TODO - test exception
    pub def readFile(path: FilePath, cs: Text.Charset): Result[String, String] & Impure =
        try {
            import java.nio.file.Files:readString(##java.nio.file.Path, ##java.nio.charset.Charset);
            let FilePath(path1) = path;
            let Charset(cs1) = cs;
            readString(path1, cs1) |> Ok
        }
        catch {
            case _: ##java.io.IOException => Err("IOException")
            case _: ##java.lang.Exception => Err("Exception")
        }


    pub def writeFile(path: FilePath, cs: Text.Charset, content: String): Result[Unit, String] & Impure =
        try {
            import flix.runtime.spt.sandbox.system.FileWrapper:writeString(##java.nio.file.Path, ##java.nio.charset.Charset, String);
            let FilePath(path1) = path;
            let Charset(cs1) = cs;
            writeString(path1, cs1, content);
            Ok()
        }
        catch {
            case _: ##java.io.IOException => Err("IOException")
            case _: ##java.lang.Exception => Err("Exception")
        }
}