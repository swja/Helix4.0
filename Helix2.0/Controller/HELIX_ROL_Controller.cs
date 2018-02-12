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
    public class HELIX_ROL_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_ROL_
        public IQueryable<HELIX_ROL> GetHELIX_ROL()
        {
            return db.HELIX_ROL;
        }

        // GET: api/HELIX_ROL_/5
        [ResponseType(typeof(HELIX_ROL))]
        public IHttpActionResult GetHELIX_ROL(int id)
        {
            HELIX_ROL hELIX_ROL = db.HELIX_ROL.Find(id);
            if (hELIX_ROL == null)
            {
                return NotFound();
            }

            return Ok(hELIX_ROL);
        }

        // PUT: api/HELIX_ROL_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_ROL(int id, HELIX_ROL hELIX_ROL)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_ROL.ID_ROL)
            {
                return BadRequest();
            }

            db.Entry(hELIX_ROL).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_ROLExists(id))
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

        // POST: api/HELIX_ROL_
        [ResponseType(typeof(HELIX_ROL))]
        public IHttpActionResult PostHELIX_ROL(HELIX_ROL hELIX_ROL)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_ROL.Add(hELIX_ROL);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_ROL.ID_ROL }, hELIX_ROL);
        }

        // DELETE: api/HELIX_ROL_/5
        [ResponseType(typeof(HELIX_ROL))]
        public IHttpActionResult DeleteHELIX_ROL(int id)
        {
            HELIX_ROL hELIX_ROL = db.HELIX_ROL.Find(id);
            if (hELIX_ROL == null)
            {
                return NotFound();
            }

            db.HELIX_ROL.Remove(hELIX_ROL);
            db.SaveChanges();

            return Ok(hELIX_ROL);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_ROLExists(int id)
        {
            return db.HELIX_ROL.Count(e => e.ID_ROL == id) > 0;
        }
    }
}