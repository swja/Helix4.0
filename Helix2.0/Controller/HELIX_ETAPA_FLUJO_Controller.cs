using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Helix2._0.Model;

namespace Helix2._0.Controller
{
    public class HELIX_ETAPA_FLUJO_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_ETAPA_FLUJO_
        public IQueryable<HELIX_ETAPA_FLUJO> GetHELIX_ETAPA_FLUJO()
        {
            return db.HELIX_ETAPA_FLUJO;
        }

        // GET: api/HELIX_ETAPA_FLUJO_/5
        [ResponseType(typeof(HELIX_ETAPA_FLUJO))]
        public IHttpActionResult GetHELIX_ETAPA_FLUJO(int id)
        {
            HELIX_ETAPA_FLUJO hELIX_ETAPA_FLUJO = db.HELIX_ETAPA_FLUJO.Find(id);
            if (hELIX_ETAPA_FLUJO == null)
            {
                return NotFound();
            }

            return Ok(hELIX_ETAPA_FLUJO);
        }

        // PUT: api/HELIX_ETAPA_FLUJO_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_ETAPA_FLUJO(int id, HELIX_ETAPA_FLUJO hELIX_ETAPA_FLUJO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_ETAPA_FLUJO.ID_ETAPAFLUJO)
            {
                return BadRequest();
            }

            db.Entry(hELIX_ETAPA_FLUJO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_ETAPA_FLUJOExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/HELIX_ETAPA_FLUJO_
        [ResponseType(typeof(HELIX_ETAPA_FLUJO))]
        public IHttpActionResult PostHELIX_ETAPA_FLUJO(HELIX_ETAPA_FLUJO hELIX_ETAPA_FLUJO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_ETAPA_FLUJO.Add(hELIX_ETAPA_FLUJO);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_ETAPA_FLUJO.ID_ETAPAFLUJO }, hELIX_ETAPA_FLUJO);
        }

        // DELETE: api/HELIX_ETAPA_FLUJO_/5
        [ResponseType(typeof(HELIX_ETAPA_FLUJO))]
        public IHttpActionResult DeleteHELIX_ETAPA_FLUJO(int id)
        {
            HELIX_ETAPA_FLUJO hELIX_ETAPA_FLUJO = db.HELIX_ETAPA_FLUJO.Find(id);
            if (hELIX_ETAPA_FLUJO == null)
            {
                return NotFound();
            }

            db.HELIX_ETAPA_FLUJO.Remove(hELIX_ETAPA_FLUJO);
            db.SaveChanges();

            return Ok(hELIX_ETAPA_FLUJO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_ETAPA_FLUJOExists(int id)
        {
            return db.HELIX_ETAPA_FLUJO.Count(e => e.ID_ETAPAFLUJO == id) > 0;
        }
    }
}