package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Estrellas;
import persistencia.exceptions.NonexistentEntityException;

public class EstrellasJpaController implements Serializable {

    public EstrellasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public EstrellasJpaController() {
        emf = Persistence.createEntityManagerFactory("webjpaPU");
    }
    
    

    public void create(Estrellas estrellas) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(estrellas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Estrellas estrellas) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            estrellas = em.merge(estrellas);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = estrellas.getId();
                if (findEstrellas(id) == null) {
                    throw new NonexistentEntityException("The estrellas with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estrellas estrellas;
            try {
                estrellas = em.getReference(Estrellas.class, id);
                estrellas.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estrellas with id " + id + " no longer exists.", enfe);
            }
            em.remove(estrellas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Estrellas> findEstrellasEntities() {
        return findEstrellasEntities(true, -1, -1);
    }

    public List<Estrellas> findEstrellasEntities(int maxResults, int firstResult) {
        return findEstrellasEntities(false, maxResults, firstResult);
    }

    private List<Estrellas> findEstrellasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Estrellas.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Estrellas findEstrellas(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Estrellas.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstrellasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Estrellas> rt = cq.from(Estrellas.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
