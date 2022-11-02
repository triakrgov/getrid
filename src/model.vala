/* model.vala
 *
 * Copyright 2022 locness3
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

struct TriakrEidIdentity {
    public string name;
    public string firstName;
    public string dateOfBirth;
    public string birthPlace;
    public string nationality;
    public string sex;
}

struct TriakrEidExpiration {
    public string startDate;
    public string expDate;
}

struct TriakrEidIdentifiers {
    public string pid;
    public string cardid;
    public string encryptedIdentifier;
}

struct TriakrEid {
    public TriakrEidIdentity identity;
    public string photo_b64;
    public TriakrEidExpiration expiration;
    public TriakrEidIdentifiers identifiers;
}

void getEidStructFromXmlUri (string uri) {
    var doc = new GXml.XDocument.from_uri(uri);
    var walker = doc.create_tree_walker(doc);
    /*while (walker.next_node()) {
        print ("%s", (string) walker.current_node.node_name);
    }*/

}
