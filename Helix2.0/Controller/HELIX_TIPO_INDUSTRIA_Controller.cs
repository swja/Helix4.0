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
    public class HELIX_TIPO_INDUSTRIA_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_TIPO_INDUSTRIA_
        public IQueryable<HELIX_TIPO_INDUSTRIA> GetHELIX_TIPO_INDUSTRIA()
        {
            return db.HELIX_TIPO_INDUSTRIA;
        }

        // GET: api/HELIX_TIPO_INDUSTRIA_/5
        [ResponseType(typeof(HELIX_TIPO_INDUSTRIA))]
        public IHttpActionResult GetHELIX_TIPO_INDUSTRIA(int id)
        {
            HELIX_TIPO_INDUSTRIA hELIX_TIPO_INDUSTRIA = db.HELIX_TIPO_INDUSTRIA.Find(id);
            if (hELIX_TIPO_INDUSTRIA == null)
            {
                return NotFound();
            }

            return Ok(hELIX_TIPO_INDUSTRIA);
        }

        // PUT: api/HELIX_TIPO_INDUSTRIA_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_TIPO_INDUSTRIA(int id, HELIX_TIPO_INDUSTRIA hELIX_TIPO_INDUSTRIA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_TIPO_INDUSTRIA.ID_TIPOINDUSTRIA)
            {
                return BadRequest();
            }

            db.Entry(hELIX_TIPO_INDUSTRIA).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_TIPO_INDUSTRIAExists(id))
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

        // POST: api/HELIX_TIPO_INDUSTRIA_
        [ResponseType(typeof(HELIX_TIPO_INDUSTRIA))]
        public IHttpActionResult PostHELIX_TIPO_INDUSTRIA(HELIX_TIPO_INDUSTRIA hELIX_TIPO_INDUSTRIA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_TIPO_INDUSTRIA.Add(hELIX_TIPO_INDUSTRIA);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_TIPO_INDUSTRIA.ID_TIPOINDUSTRIA }, hELIX_TIPO_INDUSTRIA);
        }

        // DELETE: api/HELIX_TIPO_INDUSTRIA_/5
        [ResponseType(typeof(HELIX_TIPO_INDUSTRIA))]
        public IHttpActionResult DeleteHELIX_TIPO_INDUSTRIA(int id)
        {
            HELIX_TIPO_INDUSTRIA hELIX_TIPO_INDUSTRIA = db.HELIX_TIPO_INDUSTRIA.Find(id);
            if (hELIX_TIPO_INDUSTRIA == null)
            {
                return NotFound();
            }

            db.HELIX_TIPO_INDUSTRIA.Remove(hELIX_TIPO_INDUSTRIA);
            db.SaveChanges();

            return Ok(hELIX_TIPO_INDUSTRIA);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_TIPO_INDUSTRIAExists(int id)
        {
            return db.HELIX_TIPO_INDUSTRIA.Count(e => e.ID_TIPOINDUSTRIA == id) > 0;
        }
    }
}