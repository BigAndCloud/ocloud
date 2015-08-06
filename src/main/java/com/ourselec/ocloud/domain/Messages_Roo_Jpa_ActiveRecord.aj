// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ourselec.ocloud.domain;

import com.ourselec.ocloud.domain.Messages;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Messages_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext(unitName = "persistenceUnit")
    transient EntityManager Messages.entityManager;
    
    public static final EntityManager Messages.entityManager() {
        EntityManager em = new Messages().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Messages.countMessageses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Messages o", Long.class).getSingleResult();
    }
    
    public static List<Messages> Messages.findAllMessageses() {
        return entityManager().createQuery("SELECT o FROM Messages o", Messages.class).getResultList();
    }
    
    public static Messages Messages.findMessages(Integer id) {
        if (id == null) return null;
        return entityManager().find(Messages.class, id);
    }
    
    public static List<Messages> Messages.findMessagesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Messages o", Messages.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional("ocloudTransactionManager")
    public void Messages.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional("ocloudTransactionManager")
    public void Messages.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Messages attached = Messages.findMessages(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional("ocloudTransactionManager")
    public void Messages.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional("ocloudTransactionManager")
    public void Messages.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional("ocloudTransactionManager")
    public Messages Messages.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Messages merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}