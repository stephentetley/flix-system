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

package flix.runtime.library.system;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * A wrapper class for File related functions.
 * This class that provides concrete, non-overloaded methods.
 */
public class FileWrapper {

    /// Sub function for `Files.writeString` as it is "varargs" in Java.
    public static void writeString(Path path, Charset charset, String content) throws Exception {
        final CharSequence content2 = content;
        Files.writeString(path, content2, charset);
    }


}