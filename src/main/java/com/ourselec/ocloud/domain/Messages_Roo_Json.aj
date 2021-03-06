// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ourselec.ocloud.domain;

import com.ourselec.ocloud.domain.Messages;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Messages_Roo_Json {
    
    public String Messages.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String Messages.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static Messages Messages.fromJsonToMessages(String json) {
        return new JSONDeserializer<Messages>().use(null, Messages.class).deserialize(json);
    }
    
    public static String Messages.toJsonArray(Collection<Messages> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String Messages.toJsonArray(Collection<Messages> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Messages> Messages.fromJsonArrayToMessageses(String json) {
        return new JSONDeserializer<List<Messages>>().use(null, ArrayList.class).use("values", Messages.class).deserialize(json);
    }
    
}
