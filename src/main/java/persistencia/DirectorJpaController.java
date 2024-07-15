
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Pelicula;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Director;
import persistencia.exceptions.NonexistentEntityException;

public class DirectorJpaController implements Serializable {

    public DirectorJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public DirectorJpaController() {
        emf = Persistence.createEntityManagerFactory("webjpaPU");
    }
        

    public void create(Director director) {
        if (director.getPeliculas() == null) {
            director.setPeliculas(new HashSet<Pelicula>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Set<Pelicula> attachedPeliculas = new HashSet<Pelicula>();
            for (Pelicula peliculasPeliculaToAttach : director.getPeliculas()) {
                peliculasPeliculaToAttach = em.getReference(peliculasPeliculaToAttach.getClass(), peliculasPeliculaToAttach.getId());
                attachedPeliculas.add(peliculasPeliculaToAttach);
            }
            director.setPeliculas(attachedPeliculas);
            em.persist(director);
            for (Pelicula peliculasPelicula : director.getPeliculas()) {
                Director oldDirectorOfPeliculasPelicula = peliculasPelicula.getDirector();
                peliculasPelicula.setDirector(director);
                peliculasPelicula = em.merge(peliculasPelicula);
                if (oldDirectorOfPeliculasPelicula != null) {
                    oldDirectorOfPeliculasPelicula.getPeliculas().remove(peliculasPelicula);
                    oldDirectorOfPeliculasPelicula = em.merge(oldDirectorOfPeliculasPelicula);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Director director) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Director persistentDirector = em.find(Director.class, director.getId());
            Set<Pelicula> peliculasOld = persistentDirector.getPeliculas();
            Set<Pelicula> peliculasNew = director.getPeliculas();
            Set<Pelicula> attachedPeliculasNew = new HashSet<Pelicula>();
            for (Pelicula peliculasNewPeliculaToAttach : peliculasNew) {
                peliculasNewPeliculaToAttach = em.getReference(peliculasNewPeliculaToAttach.getClass(), peliculasNewPeliculaToAttach.getId());
                attachedPeliculasNew.add(peliculasNewPeliculaToAttach);
            }
            peliculasNew = attachedPeliculasNew;
            director.setPeliculas(peliculasNew);
            director = em.merge(director);
            for (Pelicula peliculasOldPelicula : peliculasOld) {
                if (!peliculasNew.contains(peliculasOldPelicula)) {
                    peliculasOldPelicula.setDirector(null);
                    peliculasOldPelicula = em.merge(peliculasOldPelicula);
                }
            }
            for (Pelicula peliculasNewPelicula : peliculasNew) {
                if (!peliculasOld.contains(peliculasNewPelicula)) {
                    Director oldDirectorOfPeliculasNewPelicula = peliculasNewPelicula.getDirector();
                    peliculasNewPelicula.setDirector(director);
                    peliculasNewPelicula = em.merge(peliculasNewPelicula);
                    if (oldDirectorOfPeliculasNewPelicula != null && !oldDirectorOfPeliculasNewPelicula.equals(director)) {
                        oldDirectorOfPeliculasNewPelicula.getPeliculas().remove(peliculasNewPelicula);
                        oldDirectorOfPeliculasNewPelicula = em.merge(oldDirectorOfPeliculasNewPelicula);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = director.getId();
                if (findDirector(id) == null) {
                    throw new NonexistentEntityException("The director with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Director director;
            try {
                director = em.getReference(Director.class, id);
                director.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The director with id " + id + " no longer exists.", enfe);
            }
            Set<Pelicula> peliculas = director.getPeliculas();
            for (Pelicula peliculasPelicula : peliculas) {
                peliculasPelicula.setDirector(null);
                peliculasPelicula = em.merge(peliculasPelicula);
            }
            em.remove(director);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Director> findDirectorEntities() {
        return findDirectorEntities(true, -1, -1);
    }

    public List<Director> findDirectorEntities(int maxResults, int firstResult) {
        return findDirectorEntities(false, maxResults, firstResult);
    }

    private List<Director> findDirectorEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Director.class));
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

    public Director findDirector(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Director.class, id);
        } finally {
            em.close();
        }
    }

    public int getDirectorCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Director> rt = cq.from(Director.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
